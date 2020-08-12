helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator

# Get the VPC ID
export VPC_ID=$(aws eks describe-cluster --name green-capstone --query "cluster.resourcesVpcConfig.vpcId" --output text)
export ALB_INGRESS_VERSION="v1.1.8"
export AWS_REGION="us-east-2"


helm --namespace green-capstone install green-capstone \
  incubator/aws-alb-ingress-controller \
  --set image.tag=${ALB_INGRESS_VERSION} \
  --set awsRegion=${AWS_REGION} \
  --set awsVpcID=${VPC_ID} \
  --set rbac.create=false \
  --set rbac.serviceAccount.name=alb-ingress-controller \
  --set clusterName=green-capstone





kubectl -n green-capstone rollout status \
  deployment green-capstone-aws-alb-ingress-controller