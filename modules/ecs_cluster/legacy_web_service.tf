resource "aws_ecs_service" "legacy_web" {
  name        = var.ecs_legacy_web_service_name
  cluster     = aws_ecs_cluster.this.id
  launch_type = "FARGATE"

  task_definition = aws_ecs_task_definition.legacy_web.arn

  desired_count = 1

  network_configuration {
    subnets          = data.aws_subnets.task.ids
    security_groups  = [aws_security_group.ecs_task.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = "${aws_service_discovery_service.legacy_web.arn}"
  }
}

resource "aws_service_discovery_service" "legacy_web" {
    name = var.ecs_legacy_web_service_name

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