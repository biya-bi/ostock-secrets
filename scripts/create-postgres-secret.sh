#!/bin/bash

set -eu

namespace="ostock"

secret_name="$1"
secret_yaml_file="$2"
url="$3"
user="$4"
password="$5"

kubectl create secret generic "${secret_name}" \
    --from-literal=url="${url}" \
    --from-literal=user="${user}" \
    --from-literal=password="${password}" \
    -o yaml \
    --namespace="${namespace}" \
    --dry-run=client \
    | grep -v "\s*creationTimestamp:\s*null" > "${secret_yaml_file}"