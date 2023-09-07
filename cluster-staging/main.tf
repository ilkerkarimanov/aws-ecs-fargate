provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Environment = "staging"
      Deployment = "staging-ecs-cluster"
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
    key            = "cluster-staging/terraform.tfstate"
    region         = "eu-west-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "infra-tfstate-locks"
    encrypt        = true
  }
}
*/

module "ecs_cluster" {
    source = "../modules/ecs_cluster"

    ecs_cluster_network_name = "staging-ecs-network"
    ecs_cluster_name = "staging-cluster-ecs"
    ecs_task_role = {
        execRoleName = "staging-ecs-task-exec-role"
        taskRoleName = "staging-ecs-task-run-role"
    }
    ecs_sg_alb_name = "staging-ecs-sg-alb"
    ecs_sg_task_name = "staging-ecs-sg-task"
    ecs_alb_name = "staging-ecs-alb"
    ecs_service_discovery_domain_name = "staging.local"
    ecs_service_discovery_service_name = "staging-ecs-sds"

    ecs_core_api_task_def_name = "staging-ecs-core-api-task-def"
    ecs_core_api_image_repo_name = "staging-core-api"
    ecs_core_api_container_name = "staging-ecs-core-api-container"
    ecs_core_api_service_name = "staging-ecs-core-api-service"
    ecs_core_api_alb_target_group_name = "staging-ecs-core-api-alb-tg"

    ecs_legacy_api_task_def_name = "staging-ecs-legacy-api-task-def"
    ecs_legacy_api_image_repo_name = "staging-legacy-api"
    ecs_legacy_api_container_name = "staging-ecs-legacy-api-container"
    ecs_legacy_api_service_name = "staging-ecs-legacy-api-service"

    ecs_legacy_web_task_def_name = "staging-ecs-legacy-web-task-def"
    ecs_legacy_web_image_repo_name = "staging-legacy-web"
    ecs_legacy_web_container_name = "staging-ecs-legacy-web-container"
    ecs_legacy_web_service_name = "staging-ecs-legacy-web-service"
}