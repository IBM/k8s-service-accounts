# k8s-service-accounts

## Directories
**examples:** contains example YAMLs for creating service accounts in Kubernetes
**docker:** contains Dockerfile used in the create the image in


## Running on Minikube
Enable RBAC and Audit Logs on Minikube
``` bash
minikube start --extra-config=apiserver.Authorization.Mode=RBAC --extra-config=apiserver.Audit.Path=/var/log/apiserver/audit.log
```

