resource "aws_lb" "test" {
  name               = "terratest"
  internal           = false
  load_balancer_type = "network"
  subnets            = aws_subnet.public_1.*.id

  enable_deletion_protection = false

  tags = {
    Environment = "terratest"
  }
}