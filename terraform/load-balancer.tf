resource "aws_lb" "load-balncer" {
  name               = "weather-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [for subnet in aws_subnet.main : subnet.id]

  tags = {
    Name = "weather-lb"
  }
}

resource "aws_lb_target_group" "target-group" {
  name     = "weather-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.weather-vpc.id
}

resource "aws_lb_target_group_attachment" "instance-attach" {
  count            = length(var.availability_zones)
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = aws_instance.weather-instance[count.index].id
  port             = 80
}

resource "aws_lb_listener" "forwarding" {
  load_balancer_arn = aws_lb.load-balncer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:732887255406:certificate/e8ff5e33-4fd8-4402-b056-b3ab27799259"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}

resource "aws_lb_listener" "http-forward" {
  load_balancer_arn = aws_lb.load-balncer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


