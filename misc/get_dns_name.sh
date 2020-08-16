export ALB_ADDRESS=$(kubectl get ingress -n green-capstone -o json | jq -r '.items[].status.loadBalancer.ingress[].hostname')

echo "http://${ALB_ADDRESS}"