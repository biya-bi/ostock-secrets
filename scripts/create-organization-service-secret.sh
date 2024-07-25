#!/bin/bash

set -eu

namespace="ostock"

secret_name="$1"
secret_yaml_file="$2"
jwt_issuer_uri="$3"
datasource_url="$4"
datasource_username="$5"
datasource_password="$6"

kubectl create secret generic "${secret_name}" \
    --from-literal=jwt-issuer-uri="${jwt_issuer_uri}" \
    --from-literal=datasource-url="${datasource_url}" \
    --from-literal=datasource-username="${datasource_username}" \
    --from-literal=datasource-password="${datasource_password}" \
    -o yaml \
    --namespace="${namespace}" \
    --dry-run=client \
    | grep -v "\s*creationTimestamp:\s*null" > "${secret_yaml_file}"