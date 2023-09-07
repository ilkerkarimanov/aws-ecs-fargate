data "aws_vpc" "this" {
  default = true
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
