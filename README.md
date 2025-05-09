# Platform Lab Local

This project aims to simulate a local environment for testing infrastructure, GitOps, microservices, security, and resilience.

## Project Structure

- **infra/**: Infrastructure as code configuration.
- **gitops/**: Management of applications and configurations using GitOps.
- **services/**: Microservice services with different technologies.
- **observability/**: Tools for monitoring and distributed tracing.
- **security/**: Security policies, image scanning, and SBOM.
- **chaos/**: Chaos engineering simulation.
- **tools/**: Supporting tools like feature flags and contract testing.

## Requirements

- Docker
- Kubernetes (Minikube, Kind, etc.)
- Terraform
- ArgoCD or FluxCD
- Prometheus, Grafana, Tempo
- OPA, Trivy, Pact

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/omaciasd/platform-lab-local.git
    ```

2. Navigate to the corresponding directories based on what you need to configure (infra, services, etc.).

## Usage

### 1. Deploy infrastructure with Terraform:

```bash
cd infra/terraform
terraform init
terraform apply
```

### 2. Deploy applications with ArgoCD:

```bash
cd gitops/argo-cd
kubectl apply -f argo-cd-manifests/
```

### 3. View Prometheus dashboards:

Once Prometheus is set up, visit the following URL to access the Prometheus dashboard:
http://<prometheus-server-ip>:9090

### 4. View Prometheus dashboards:

After deploying Grafana, you can access it via:
http://<grafana-server-ip>:3000

Use the default login credentials:

- Credentials: admin

### 5. Run chaos tests:

```bash
cd chaos/litmus-chaos
kubectl apply -f chaos_engine.yaml
```
