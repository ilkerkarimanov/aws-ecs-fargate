variable "ecs_cluster_network_name" {
  description = "The name of the esc network"
  type        = string
}

variable "ecs_subnet_ip_range" {
    description = "The CIDR range of the esc network"
    type = string
}

variable "ecs_availability_zone" {
    description = "The name of the availability zone of the ecs network"
    type = string
}