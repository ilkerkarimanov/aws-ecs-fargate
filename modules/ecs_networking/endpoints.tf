resource "aws_vpc_endpoint" "s3" {
  vpc_id       = data.aws_vpc.this.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = [aws_route_table.this.id]
  tags = {
    Name = "${var.ecs_cluster_network_name}-s3"
  }
}


resource "aws_vpc_endpoint" "ecr-dkr-endpoint" {
 vpc_id       = data.aws_vpc.this.id
 private_dns_enabled = true
 service_name = "com.amazonaws.${data.aws_region.current.name}.ecr.dkr"
 vpc_endpoint_type = "Interface"
 security_group_ids = [aws_security_group.this.id]
 subnet_ids = [aws_subnet.this.id]
 tags = {
    Name = "${var.ecs_cluster_network_name}-ecr-dkr"
  }
}

resource "aws_vpc_endpoint" "ecr-api-endpoint" {
 vpc_id       = data.aws_vpc.this.id
 service_name = "com.amazonaws.${data.aws_region.current.name}.ecr.api"
 vpc_endpoint_type = "Interface"
 private_dns_enabled = true
 security_group_ids = [aws_security_group.this.id]
 subnet_ids = [aws_subnet.this.id]
 tags = {
    Name = "${var.ecs_cluster_network_name}-ecr-api"
  }
}

resource "aws_vpc_endpoint" "cloudwatch-logs" {
 vpc_id       = data.aws_vpc.this.id
 service_name = "com.amazonaws.${data.aws_region.current.name}.logs"
 vpc_endpoint_type = "Interface"
 private_dns_enabled = true
 security_group_ids = [aws_security_group.this.id]
 subnet_ids = [aws_subnet.this.id]
 tags = {
    Name = "${var.ecs_cluster_network_name}-awslogs"
  }
}





