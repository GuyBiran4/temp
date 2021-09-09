#tfsec:ignore:AWS078 tfsec:ignore:AWS093
resource "aws_ecr_repository" "strategyworker" {
  provider             = aws.build
  name                 = "strategyworker"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    iac     = var.aws_iac_tag
    env     = var.aws_dev_env_tag
    product = "pipe"
  }
}
