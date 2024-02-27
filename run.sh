
helm create le-cert
helm template  -f ./values.yaml  --debug  .

helm upgrade --dry-run --install --wait --timeout 10m0s --debug --history-max 0  -n default --create-namespace  -f ./values-staging.yaml   le-cert  .
helm delete --wait -n default  le-cert


kubectl wait --for='jsonpath={.status.conditions[?(@.type=="Ready")].status}=True' certificate/letsencrypt-stage-cert

