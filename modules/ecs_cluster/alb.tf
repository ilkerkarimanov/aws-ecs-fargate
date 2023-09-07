resource "aws_lb" "this" {
  name            = var.ecs_alb_name
  security_groups = [aws_security_group.ecs_alb.id]
  subnets         = data.aws_subnets.this.ids
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "ECS ALB is live now."
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "core_api" {
  name = var.ecs_core_api_alb_target_group_name
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.this.id
  health_check {
    path = "/healthcheck"
    timeout = 5
    interval = 30
    matcher = "200"
  }
}

resource "aws_lb_listener_rule" "core_api" {
  listener_arn = aws_lb_listener.this.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.core_api.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}