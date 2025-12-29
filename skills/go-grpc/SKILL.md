---
name: go-grpc
description: gRPC services - Protocol Buffers, streaming, interceptors, and microservices
sasmp_version: "1.3.0"
bonded_agent: go-web
bond_type: SECONDARY_BOND
---

# Go gRPC Skill

## Overview

Master gRPC in Go - build efficient, type-safe microservices with Protocol Buffers.

## Core Concepts

### 1. Protocol Buffers Definition
```protobuf
// user.proto
syntax = "proto3";

package user;
option go_package = "github.com/user/project/pb";

// Service definition
service UserService {
    // Unary RPC
    rpc GetUser(GetUserRequest) returns (GetUserResponse);
    rpc CreateUser(CreateUserRequest) returns (CreateUserResponse);

    // Server streaming
    rpc ListUsers(ListUsersRequest) returns (stream User);

    // Client streaming
    rpc UploadUsers(stream User) returns (UploadResponse);

    // Bidirectional streaming
    rpc Chat(stream Message) returns (stream Message);
}

// Messages
message User {
    int64 id = 1;
    string name = 2;
    string email = 3;
    int32 age = 4;
    repeated string roles = 5;
    map<string, string> metadata = 6;
}

message GetUserRequest {
    int64 id = 1;
}

message GetUserResponse {
    User user = 1;
}

message CreateUserRequest {
    string name = 1;
    string email = 2;
    int32 age = 3;
}

message CreateUserResponse {
    User user = 1;
}
```

### 2. Generate Go Code
```bash
# Install protoc plugins
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Generate code
protoc --go_out=. --go_opt=paths=source_relative \
       --go-grpc_out=. --go-grpc_opt=paths=source_relative \
       proto/user.proto
```

### 3. Server Implementation
```go
package main

import (
    "context"
    "log"
    "net"

    "google.golang.org/grpc"
    pb "github.com/user/project/pb"
)

type userServer struct {
    pb.UnimplementedUserServiceServer
    users map[int64]*pb.User
}

// Unary RPC
func (s *userServer) GetUser(ctx context.Context, req *pb.GetUserRequest) (*pb.GetUserResponse, error) {
    user, ok := s.users[req.Id]
    if !ok {
        return nil, status.Errorf(codes.NotFound, "user not found")
    }
    return &pb.GetUserResponse{User: user}, nil
}

func (s *userServer) CreateUser(ctx context.Context, req *pb.CreateUserRequest) (*pb.CreateUserResponse, error) {
    user := &pb.User{
        Id:    int64(len(s.users) + 1),
        Name:  req.Name,
        Email: req.Email,
        Age:   req.Age,
    }
    s.users[user.Id] = user
    return &pb.CreateUserResponse{User: user}, nil
}

// Server streaming
func (s *userServer) ListUsers(req *pb.ListUsersRequest, stream pb.UserService_ListUsersServer) error {
    for _, user := range s.users {
        if err := stream.Send(user); err != nil {
            return err
        }
    }
    return nil
}

func main() {
    lis, err := net.Listen("tcp", ":50051")
    if err != nil {
        log.Fatal(err)
    }

    grpcServer := grpc.NewServer()
    pb.RegisterUserServiceServer(grpcServer, &userServer{
        users: make(map[int64]*pb.User),
    })

    log.Println("gRPC server listening on :50051")
    grpcServer.Serve(lis)
}
```

### 4. Client Implementation
```go
package main

import (
    "context"
    "io"
    "log"
    "time"

    "google.golang.org/grpc"
    "google.golang.org/grpc/credentials/insecure"
    pb "github.com/user/project/pb"
)

func main() {
    // Connect
    conn, err := grpc.Dial("localhost:50051",
        grpc.WithTransportCredentials(insecure.NewCredentials()),
    )
    if err != nil {
        log.Fatal(err)
    }
    defer conn.Close()

    client := pb.NewUserServiceClient(conn)
    ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
    defer cancel()

    // Unary call
    resp, err := client.CreateUser(ctx, &pb.CreateUserRequest{
        Name:  "John",
        Email: "john@example.com",
        Age:   30,
    })
    if err != nil {
        log.Fatal(err)
    }
    log.Printf("Created user: %v", resp.User)

    // Server streaming
    stream, err := client.ListUsers(ctx, &pb.ListUsersRequest{})
    if err != nil {
        log.Fatal(err)
    }
    for {
        user, err := stream.Recv()
        if err == io.EOF {
            break
        }
        if err != nil {
            log.Fatal(err)
        }
        log.Printf("User: %v", user)
    }
}
```

### 5. Interceptors (Middleware)
```go
// Unary interceptor
func loggingInterceptor(
    ctx context.Context,
    req interface{},
    info *grpc.UnaryServerInfo,
    handler grpc.UnaryHandler,
) (interface{}, error) {
    start := time.Now()
    resp, err := handler(ctx, req)
    log.Printf("Method: %s, Duration: %v, Error: %v",
        info.FullMethod, time.Since(start), err)
    return resp, err
}

// Auth interceptor
func authInterceptor(
    ctx context.Context,
    req interface{},
    info *grpc.UnaryServerInfo,
    handler grpc.UnaryHandler,
) (interface{}, error) {
    md, ok := metadata.FromIncomingContext(ctx)
    if !ok {
        return nil, status.Error(codes.Unauthenticated, "no metadata")
    }
    
    tokens := md.Get("authorization")
    if len(tokens) == 0 {
        return nil, status.Error(codes.Unauthenticated, "no token")
    }
    
    // Validate token...
    return handler(ctx, req)
}

// Apply interceptors
grpcServer := grpc.NewServer(
    grpc.UnaryInterceptor(loggingInterceptor),
    // Or chain multiple:
    grpc.ChainUnaryInterceptor(
        loggingInterceptor,
        authInterceptor,
    ),
)
```

### 6. Metadata (Headers)
```go
// Client: send metadata
md := metadata.New(map[string]string{
    "authorization": "Bearer token123",
    "request-id":    "abc123",
})
ctx := metadata.NewOutgoingContext(ctx, md)
resp, err := client.GetUser(ctx, req)

// Server: receive metadata
md, ok := metadata.FromIncomingContext(ctx)
if ok {
    tokens := md.Get("authorization")
    requestID := md.Get("request-id")
}

// Server: send response metadata
header := metadata.Pairs("response-time", "50ms")
grpc.SendHeader(ctx, header)
```

### 7. Error Handling
```go
import (
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
)

// Return error with code
func (s *server) GetUser(ctx context.Context, req *pb.GetUserRequest) (*pb.GetUserResponse, error) {
    user, ok := s.users[req.Id]
    if !ok {
        return nil, status.Errorf(codes.NotFound, "user %d not found", req.Id)
    }
    
    if err := validate(user); err != nil {
        return nil, status.Errorf(codes.InvalidArgument, "invalid user: %v", err)
    }
    
    return &pb.GetUserResponse{User: user}, nil
}

// Client: handle errors
resp, err := client.GetUser(ctx, req)
if err != nil {
    st, ok := status.FromError(err)
    if ok {
        switch st.Code() {
        case codes.NotFound:
            log.Printf("User not found: %s", st.Message())
        case codes.InvalidArgument:
            log.Printf("Invalid argument: %s", st.Message())
        default:
            log.Printf("Error: %s", st.Message())
        }
    }
    return err
}
```

## Quick Reference

| gRPC Code | HTTP Equivalent | Use Case |
|-----------|-----------------|----------|
| `OK` | 200 | Success |
| `NotFound` | 404 | Resource not found |
| `InvalidArgument` | 400 | Bad request |
| `Unauthenticated` | 401 | No/invalid auth |
| `PermissionDenied` | 403 | Not authorized |
| `Internal` | 500 | Server error |

## Related
- `go-http` - REST APIs
- `go-patterns` - Microservice patterns
