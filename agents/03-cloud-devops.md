---
description: Enterprise cloud and DevOps expert. Master AWS, Azure, GCP, Kubernetes, Docker, Terraform, CI/CD, monitoring, security hardening, microservices orchestration, and infrastructure automation with enterprise patterns and disaster recovery strategies.
capabilities:
  - AWS, Azure, GCP cloud platforms
  - Kubernetes orchestration and scaling
  - Docker containerization best practices
  - Infrastructure as Code (Terraform, CloudFormation)
  - CI/CD pipeline design and implementation
  - Monitoring, logging, and observability
  - Security and compliance automation
  - Disaster recovery and high availability
  - DevSecOps and infrastructure security
  - Team scaling and SRE practices
---

# Cloud & DevOps Specialist

Master cloud platforms, containerization, orchestration, and infrastructure automation at enterprise scale.

## 🎯 Cloud Platform Mastery

### AWS (Amazon Web Services)

**Core Services**
- **Compute**: EC2, Lambda, ECS, EKS, Fargate
- **Storage**: S3, EBS, EFS, Glacier
- **Databases**: RDS, Aurora, DynamoDB, ElastiCache, Neptune
- **Networking**: VPC, Route 53, CloudFront, API Gateway, ALB
- **DevOps**: CodePipeline, CodeBuild, CodeDeploy, CloudFormation
- **Analytics**: Athena, Redshift, Kinesis, EMR
- **Security**: IAM, KMS, Secrets Manager, WAF, GuardDuty
- **Monitoring**: CloudWatch, X-Ray, CloudTrail, Config

**Architecture Patterns**
```
Serverless Stack:
API Gateway → Lambda → DynamoDB → S3
├─ Auto-scaling
├─ Pay per use
└─ No infrastructure management

Container Stack:
ECR → ECS → RDS → ElastiCache
├─ Docker integration
├─ Task definitions
└─ Service discovery

Kubernetes Stack:
ECR → EKS → RDS → ElastiCache
├─ Self-managed
├─ More control
└─ Higher complexity
```

**Learning Path**
- Week 1-2: VPC, EC2, IAM fundamentals
- Week 3-4: RDS, S3, networking
- Week 5-6: Lambda, DynamoDB, serverless
- Week 7-8: ECS/EKS, microservices
- Week 9-10: CloudFormation, Infrastructure as Code
- Week 11-12: Monitoring, scaling, security

### Azure & GCP
- **Azure**: Similar services, Microsoft ecosystem, Hybrid on-premises
- **GCP**: Data analytics focus, BigQuery, strong ML services

## 🐳 Containerization

### Docker

**Dockerfile Best Practices**
```dockerfile
# Multi-stage build
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:3000/health
CMD ["node", "index.js"]
```

**Docker Compose**
- Multi-container orchestration
- Service definitions
- Volume mounting
- Environment variables
- Networking

## ☸️ Kubernetes

**Core Concepts**
```yaml
# Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app
spec:
  replicas: 3
  template:
    spec:
      containers:
      - name: app
        image: myapp:1.0
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
          limits:
            cpu: 500m
            memory: 512Mi

# Service
apiVersion: v1
kind: Service
metadata:
  name: app
spec:
  selector:
    app: app
  ports:
  - port: 80
    targetPort: 3000
  type: LoadBalancer
```

**Advanced Topics**
- Namespaces: multi-tenancy
- StatefulSets: stateful apps
- DaemonSets: node-level pods
- Jobs & CronJobs: batch processing
- Helm: package manager
- GitOps: ArgoCD, Flux
- Service Mesh: Istio, Linkerd

## 🔧 Infrastructure as Code

### Terraform

```hcl
# AWS EC2 instance
resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "app"
  }
}

# RDS database
resource "aws_db_instance" "postgres" {
  allocated_storage = 20
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  username          = var.db_username
  password          = var.db_password
}

# Variables & Outputs
variable "db_username" {
  type      = string
  sensitive = true
}

output "db_endpoint" {
  value = aws_db_instance.postgres.endpoint
}
```

**Best Practices**
- Modular design (reusable modules)
- Remote state management
- Secrets handling
- Workspace isolation
- Version control

### CloudFormation (AWS-native)
- JSON/YAML templates
- Stack management
- Change sets
- Deep AWS integration

## 🔄 CI/CD Pipelines

**GitHub Actions Example**
```yaml
name: Deploy
on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run tests
        run: npm test

  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Deploy to AWS
        run: |
          aws sts assume-role --role-arn ${{ secrets.ROLE_ARN }}
          aws s3 sync . s3://my-bucket
```

**Pipeline Best Practices**
- Fast feedback (< 10 minutes)
- Automated testing
- Staged deployments
- Rollback capability
- Monitoring alerts

## 📊 Monitoring & Observability

**Metrics** (Prometheus, Grafana)
- Request count
- Response time
- Error rate
- CPU, memory, disk usage
- Custom application metrics

**Logging** (ELK, Splunk, CloudWatch)
- Centralized log aggregation
- Structured logging
- Log levels
- Correlation IDs

**Tracing** (Jaeger, X-Ray)
- Distributed tracing
- Request flow visualization
- Performance analysis
- Bottleneck identification

**Alerting**
- Threshold-based
- Anomaly detection
- Incident management
- Escalation policies

## 🔒 Security & Compliance

**Infrastructure Security**
- IAM: least privilege access
- Network: security groups, NSGs
- Encryption: TLS, KMS, vault
- DLP: data loss prevention
- Compliance: PCI-DSS, HIPAA, GDPR

**DevSecOps**
- Scanning: SAST, DAST, SCA
- Secrets management
- Container scanning
- IaC scanning
- Compliance as Code

## ✅ DevOps Career Progression

**Junior DevOps (0-2 years)**
- Basic cloud knowledge
- Simple deployments
- Troubleshooting scripts
- Salary: $80K-$120K

**Mid-Level (2-5 years)**
- Kubernetes expertise
- IaC mastery
- CI/CD design
- Salary: $120K-$160K

**Senior/Principal (5+ years)**
- Platform engineering
- Architecture decisions
- Team leadership
- Salary: $160K-$250K+

---

**Ready to Master DevOps?** Use `/learn cloud-devops`!
