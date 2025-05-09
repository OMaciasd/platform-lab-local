#!/bin/bash
set -e

kind create cluster --name platform-lab --config ../infra/kind-cluster.yaml

kubectl create namespace argocd || true
kubectl apply -n argocd -f ../gitops/argo-cd/install.yaml

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

kubectl create namespace observability || true

helm install prometheus prometheus-community/prometheus \
  --namespace observability \
  -f ../observability/prometheus/values.yaml

helm install grafana grafana/grafana \
  --namespace observability \
  -f ../observability/grafana/values.yaml

helm install tempo grafana/tempo \
  --namespace observability \
  -f ../observability/tempo/values.yaml

kubectl apply -f ../observability/grafana/k8s-dashboard-configmap.yaml -n observability
kubectl apply -f ../observability/grafana/tempo-dashboard-configmap.yaml -n observability

kubectl apply -f ../services/microservice-a/
kubectl apply -f ../services/microservice-b/

kubectl apply -f ../gitops/argo-cd/apps/ -n argocd

echo "✅ Entorno GitOps local desplegado correctamente."
