resource "aws_security_group" "this" {
  name = var.ecs_cluster_network_name
  vpc_id = data.aws_vpc.this.id
  tags = {
    Name = var.ecs_cluster_network_name
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.ecs_subnet_ip_range]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}