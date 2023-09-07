# aws-ecs-fargate

Reference setup for basic scenarios of ECS deployment with FARGATE \
Scenario #1: \
Web + Web API setup that has dynamic environment configuration based on service discovery. \
Scenario #2: \
Public Web API setup that has application load balancer setup.

The modules setup \
global - global management of terraform state.
  - You want to move the terraform start on shared location (S3) and locking mechanism (AWS Dynamo DB) to be incorporated to synchronize changes.
  - The default experience is tfstate to be stored in the repo. 

networking - a crucial module that is mostly missed in internet samples. 
  - By default, AWS ECS will pull images over the internet no matter if you're using AWS ECR. 
  - In order to be applied to host ECS service in the private networking and ensure private connectivity to ECR you will require a set of VPC endpoints and NAT gateway.

cluster - the actual setup with the goodies you can get. 
  - AWS application load balancer 
  - AWS service discover 
  - AWS container insights 
  - AWS Cloudwatch logging 
  - AWS service groups 
  - AWS IAM roles 
  - AWS Service/Task definition with FARGATE Windows Server Core/ Nano Server (.NET Core)
