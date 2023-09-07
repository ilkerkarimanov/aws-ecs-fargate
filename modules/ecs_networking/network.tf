resource "aws_subnet" "this" {
  vpc_id     = data.aws_vpc.this.id
  cidr_block = var.ecs_subnet_ip_range
  availability_zone = var.ecs_availability_zone

  tags = {
    Name = var.ecs_cluster_network_name
  }
}

resource "aws_route_table" "this" {
  vpc_id = data.aws_vpc.this.id

  tags = {
    Name = var.ecs_cluster_network_name
  }
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}