provider "aws" {
  region = "[region]" // a predefined region e.g. "eu-west-1"

  default_tags {
    tags = {
      Environment = "staging"
      Deployment = "staging-ecs-network"
    }
  }
}

/*
Use aws s3 and cosmodb for tfstate persistence and locking mechanism,
 by default it is local files.
 */
/*
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "infra-tfstate"
    key            = "network-staging/terraform.tfstate"
    region         = "eu-west-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "infra-tfstate-locks"
    encrypt        = true
  }
}
*/

module "ecs_networking" {
    source = "../modules/ecs_networking"

    ecs_cluster_network_name = "staging-ecs-network"
    ecs_subnet_ip_range = "172.31.144.0/20" //a predefined "private" subnet range for cluster networks 
    ecs_availability_zone = "eu-west-1b" //a predefined availability zone e.g.
}