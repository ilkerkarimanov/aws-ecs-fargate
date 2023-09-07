resource "aws_service_discovery_private_dns_namespace" "this" {
    name = var.ecs_service_discovery_domain_name
    vpc = data.aws_vpc.this.id
}