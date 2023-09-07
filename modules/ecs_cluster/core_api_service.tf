resource "aws_ecs_service" "core_api" {
  name        = var.ecs_core_api_service_name
  cluster     = aws_ecs_cluster.this.id
  launch_type = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.core_api.arn
    container_port   = 80
    container_name   = var.ecs_core_api_container_name
  }

  task_definition = aws_ecs_task_definition.core_api.arn

  desired_count = 1

  network_configuration {
    subnets          = data.aws_subnets.task.ids
    security_groups  = [aws_security_group.ecs_task.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = "${aws_service_discovery_service.core_api.arn}"
  }
  
  depends_on = [aws_lb.this]
}

resource "aws_service_discovery_service" "core_api" {
    name = var.ecs_core_api_service_name

    dns_config {
        namespace_id   = aws_service_discovery_private_dns_namespace.this.id
        routing_policy = "MULTIVALUE"
        dns_records {
        ttl  = 10
        type = "A"
        }
    }
    health_check_custom_config {
        failure_threshold = 5
    }
}
