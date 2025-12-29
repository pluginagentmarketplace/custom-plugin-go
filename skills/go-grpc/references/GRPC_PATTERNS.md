# gRPC Patterns

## RPC Types
- Unary: Single request/response
- Server streaming: Single request, multiple responses
- Client streaming: Multiple requests, single response
- Bidirectional: Multiple requests and responses

## Error Codes
- OK (0), NotFound (5), InvalidArgument (3)
- Unauthenticated (16), Internal (13)
