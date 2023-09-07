resource "aws_ecs_task_definition" "legacy_web" {
  family                   = var.ecs_legacy_web_task_def_name
  memory                   = 2048
  cpu                      = 1024
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.task_role.arn
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  network_mode             = "awsvpc"
  container_definitions = jsonencode(
    [{
      "name" : "${var.ecs_legacy_web_container_name}"
      "image" : "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${var.ecs_legacy_web_image_repo_name}",
      "portMappings" : [
        { containerPort = 80 }
      ],
      "healthCheck" : {
      command = [ "CMD-SHELL", "curl -f http://localhost/healthcheck.html || exit 1" ]
      startPeriod = 30
      timeout = 10
      interval = 60
      retries = 3
      matcher = 200
      },
      "environment": [
          {
            "name": "API_SERVER",
            "value": "http://${var.ecs_legacy_api_service_name}.${var.ecs_service_discovery_domain_name}/"
          },
          {
            "name": "NETCORE_ENVIRONMENT"
            "value": "staging"
          }
      ],
      "logConfiguration" : {
          logDriver = "awslogs"
          options = {
              awslogs-group = "/ecs/${var.ecs_legacy_web_task_def_name}"
              awslogs-region = data.aws_region.current.name
              awslogs-stream-prefix = "ecs"
          }
      }
    }]
  )
  runtime_platform {
    operating_system_family = "WINDOWS_SERVER_2022_CORE"
    cpu_architecture        = "X86_64"
  }
}