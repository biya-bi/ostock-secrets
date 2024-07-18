#!/bin/bash

set -eu

namespace="ostock"

secret_name="$1"
secret_yaml_file="$2"
encrypt_key="$3"

kubectl create secret generic "${secret_name}" \
    --from-literal=encrypt.key="${encrypt_key}" \
    -o yaml \
    --namespace="${namespace}" \
    --dry-run=client \
    | grep -v "\s*creationTimestamp:\s*null" > "${secret_yaml_file}"