---
name: cloud-devops
description: Master cloud platforms (AWS, Azure, GCP), containerization (Docker, Kubernetes), infrastructure as code (Terraform), CI/CD pipelines, and DevOps practices for scalable systems.
---

# Cloud & DevOps Skills

## Quick Start

Deploy your first application to the cloud:

### Docker - Containerization
```dockerfile
# Dockerfile - Package your application
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]

# Build: docker build -t myapp:1.0 .
# Run: docker run -p 3000:3000 myapp:1.0
```

### Terraform - Infrastructure as Code
```hcl
# main.tf - Define cloud infrastructure
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ec2_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "web-server"
  }
}

# Apply: terraform init && terraform apply
```

### Kubernetes - Orchestration
```yaml
# deployment.yaml - Deploy containerized app
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web-app
  template:
    metadata:
      labels:
        app: web-app
    spec:
      containers:
      - name: web-app
        image: myapp:1.0
        ports:
        - containerPort: 3000
        env:
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: db-credentials
              key: url
```

## Core DevOps Concepts

### Infrastructure as Code (IaC)
- **Terraform**: Multi-cloud, declarative
- **CloudFormation**: AWS-native, JSON/YAML
- **Ansible**: Agentless configuration management
- **Pulumi**: Programming languages approach
- Benefits: Repeatability, versioning, automation

### Containerization
- **Docker**: Image building, container execution
- **Image Registry**: Docker Hub, ECR, ACR, GCR
- **Optimization**: Multi-stage builds, layer caching
- **Security**: Image scanning, minimal base images
- **Networking**: Bridge, host, overlay networks

### Container Orchestration
- **Kubernetes**: Industry standard, complex but powerful
- **Core Concepts**: Pods, Services, Deployments, StatefulSets
- **Scaling**: Horizontal Pod Autoscaler (HPA)
- **Service Mesh**: Istio, Linkerd for advanced networking
- **Storage**: Persistent Volumes, Storage Classes

### CI/CD Pipelines
- **Version Control**: GitHub, GitLab, Bitbucket
- **Build Automation**: Jenkins, GitHub Actions, GitLab CI
- **Testing**: Automated unit, integration, E2E tests
- **Artifact Registry**: Storing build outputs
- **Deployment**: Blue-green, canary, rolling updates

### Monitoring & Observability
- **Metrics**: Prometheus, Grafana, Datadog
- **Logging**: ELK Stack, CloudWatch, Splunk
- **Tracing**: Jaeger, X-Ray for distributed systems
- **Alerting**: Threshold-based, anomaly detection
- **SLOs**: Service Level Objectives, error budgets

## Cloud Platform Fundamentals

### AWS
- **Compute**: EC2, Lambda, ECS, EKS
- **Storage**: S3, EBS, EFS
- **Databases**: RDS, DynamoDB, ElastiCache
- **Networking**: VPC, ALB, CloudFront
- **DevOps**: CodePipeline, CloudFormation, Systems Manager

### Azure
- **Compute**: VMs, App Service, Container Instances, AKS
- **Storage**: Blob Storage, Queue, Table Storage
- **Databases**: SQL Database, Cosmos DB
- **DevOps**: Azure Pipelines, Resource Manager
- **Managed Services**: Rich PaaS offerings

### Google Cloud Platform
- **Compute**: Compute Engine, Cloud Run, GKE
- **Storage**: Cloud Storage, Firestore, Cloud SQL
- **Data**: BigQuery, Dataflow, Pub/Sub
- **ML**: Vertex AI, AutoML
- **DevOps**: Cloud Build, Deployment Manager

## DevOps Best Practices

### Security
- **IAM**: Principle of least privilege
- **Encryption**: At-rest and in-transit
- **Secrets Management**: Vault, AWS Secrets Manager
- **Network Security**: Security groups, firewalls
- **Compliance**: GDPR, HIPAA, SOC 2

### Reliability
- **High Availability**: Multi-region, auto-scaling
- **Disaster Recovery**: Backup, replication
- **Chaos Engineering**: Test failure scenarios
- **SLI/SLOs**: Define and measure reliability
- **Incident Response**: Playbooks, postmortems

### Performance
- **Database Optimization**: Indexing, query tuning
- **Caching**: Redis, CDN, application-level
- **Load Testing**: Simulate real-world usage
- **Monitoring**: Identify bottlenecks early
- **Optimization**: Iterate based on metrics

### Cost Optimization
- **Right-sizing**: Match resources to needs
- **Reserved Instances**: Long-term commitments
- **Spot Instances**: Temporary, discounted capacity
- **Cost Monitoring**: Alerts, chargeback models
- **Efficiency**: Remove unused resources

## Hands-On Projects

### Beginner
- Deploy static website to S3/Cloud Storage
- Create EC2/VM instance
- Basic Docker containerization
- Simple CloudFormation template

### Intermediate
- Deploy multi-tier application
- Set up CI/CD pipeline
- Kubernetes cluster with multiple services
- Infrastructure as Code for full stack

### Advanced
- Multi-region, multi-cloud deployment
- Service mesh with Istio
- Complex monitoring and logging
- GitOps with ArgoCD/Flux

## Key Tools & Technologies

| Domain | Tools |
|--------|-------|
| **Containerization** | Docker, Podman, Containerd |
| **Orchestration** | Kubernetes, Docker Swarm, Nomad |
| **IaC** | Terraform, Ansible, CloudFormation |
| **CI/CD** | Jenkins, GitHub Actions, GitLab CI, CircleCI |
| **Monitoring** | Prometheus, Grafana, Datadog, New Relic |
| **Logging** | ELK Stack, Splunk, CloudWatch, Loki |
| **Secrets** | Vault, AWS Secrets Manager, Azure Key Vault |

## Career Paths

### DevOps Engineer
- Focus: Automation, infrastructure, CI/CD
- Timeline: 6-12 months with strong development background

### SRE (Site Reliability Engineer)
- Focus: System reliability, automation, monitoring
- Timeline: 12-18 months with DevOps foundation

### Cloud Architect
- Focus: Design, cost optimization, compliance
- Timeline: 24+ months with deep cloud experience

### Platform Engineer
- Focus: Internal developer platforms, tooling
- Timeline: 18-24 months with DevOps experience

## Common Workflows

### Typical Deployment Pipeline
1. Developer commits code
2. Automated tests run
3. Build Docker image
4. Push to registry
5. Deploy to staging
6. Run integration tests
7. Deploy to production
8. Monitor metrics and logs

### Infrastructure Lifecycle
1. Plan infrastructure needs
2. Write IaC templates
3. Create and test in dev
4. Promote to staging
5. Validate thoroughly
6. Deploy to production
7. Monitor and optimize
8. Update as needed

## Learning Path

1. **Linux Fundamentals** (2-4 weeks)
2. **Git & Version Control** (1-2 weeks)
3. **Docker Basics** (2-3 weeks)
4. **Cloud Platform Fundamentals** (4-6 weeks)
5. **Infrastructure as Code** (3-4 weeks)
6. **Kubernetes Fundamentals** (6-8 weeks)
7. **CI/CD Implementation** (3-4 weeks)
8. **Monitoring & Observability** (3-4 weeks)

## Key Takeaways

1. Automate everything possible
2. Infrastructure should be versioned and tested
3. Monitor and log comprehensively
4. Plan for failures and recovery
5. Security is not optional
6. Cost optimization is ongoing
7. Practice in safe environments first

## Related Skills

- **Programming Languages**: Scripting for automation
- **Web Development**: Application deployment
- **Data Engineering**: Data pipeline infrastructure
- **AI/ML**: Model serving and ML operations
- **Leadership**: DevOps practices and culture

---

*For specialized DevOps paths, use `/learn cloud-devops`*
