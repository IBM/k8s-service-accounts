#!/bin/bash

# Read mounted files
KUBE_TOKEN=$(</var/run/secrets/kubernetes.io/serviceaccount/token)
NAMESPACE=$(</var/run/secrets/kubernetes.io/serviceaccount/namespace)

# Resource to get in API [pods/secrets]
RESOURCE="secrets"

# If an argument was set
if [ "$#" -ge 1 ]; then
  NAMESPACE="$1"
fi

#Curl against the resource
echo curl -sSk -H "Authorization: Bearer $KUBE_TOKEN" https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/$NAMESPACE/$RESOURCE
curl -sSk -H "Authorization: Bearer $KUBE_TOKEN" https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/$NAMESPACE/$RESOURCE
echo ""

# Don't wait on user exec
if [ "$#" -lt 1 ]; then
  # Sleep forever so the pod doesn't crash
  while [ true ]; do
    sleep 10
  done
fi
