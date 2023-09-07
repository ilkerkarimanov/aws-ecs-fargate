data "aws_vpc" "this" {
  default = true
}

data "aws_subnets" "this" {
 #all subnets for the vpc
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
  filter {
    name   = "default-for-az"
    values = [true]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_subnets" "task" {
 #all subnets for the vpc
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
  filter {
    name   = "tag:Name"
    values = [var.ecs_cluster_network_name]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
