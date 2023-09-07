variable "ecs_cluster_network_name" {
  description = "The name of the esc network"
  type        = string
}
variable "ecs_cluster_name" {
  description = "The name of the esc cluster"
  type        = string
}

variable "ecs_task_role" {
  description = "The definition of the ecs task role"
  type        = object({
    execRoleName    = string
    taskRoleName    = string
  })
}

variable "ecs_sg_task_name" {
  description = "The name of the ecs security group task"
  type        = string
}

variable "ecs_sg_alb_name" {
  description = "The name of the ecs security group load balancer"
  type        = string
}

variable "ecs_alb_name" {
  description = "The name of the ecs load balancer"
  type        = string
}

variable "ecs_service_discovery_domain_name" {
  description = "The name of the ecs service discovery domain"
  type        = string
}

variable "ecs_service_discovery_service_name" {
  description = "The name of the ecs service discovery service"
  type        = string
}

#Core Api Configuration
variable "ecs_core_api_task_def_name" {
  description = "The name of the esc core api task definition name"
  type        = string
}

variable "ecs_core_api_image_repo_name" {
  description = "The name of the esc core api repo name"
  type        = string
}

variable "ecs_core_api_container_name" {
  description = "The name of the esc core api container name"
  type        = string
}

variable "ecs_core_api_service_name" {
  description = "The name of the esc core api service name"
  type        = string
}

variable "ecs_core_api_alb_target_group_name" {
  description = "The name of the core api load balancer target group"
  type        = string
}

#Legacy Api Configuration
variable "ecs_legacy_api_task_def_name" {
  description = "The name of the esc legacy api task definition name"
  type        = string
}

variable "ecs_legacy_api_image_repo_name" {
  description = "The name of the esc legacy api repo name"
  type        = string
}

variable "ecs_legacy_api_container_name" {
  description = "The name of the esc legacy api container name"
  type        = string
}

variable "ecs_legacy_api_service_name" {
  description = "The name of the esc legacy api service name"
  type        = string
}

#Legacy Web Configuration
variable "ecs_legacy_web_task_def_name" {
  description = "The name of the esc legacy web task definition name"
  type        = string
}

variable "ecs_legacy_web_image_repo_name" {
  description = "The name of the esc legacy web repo name"
  type        = string
}

variable "ecs_legacy_web_container_name" {
  description = "The name of the esc legacy web container name"
  type        = string
}

variable "ecs_legacy_web_service_name" {
  description = "The name of the esc legacy web service name"
  type        = string
}