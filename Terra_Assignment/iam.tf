resource "aws_iam_group" "group1" {
  name = "terragrp1"
}

resource "aws_iam_group_policy" "group1_policy" {
  name  = "terragrp1_policy"
  group = aws_iam_group.group1.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user" "nu" {
  name = "newuser"
  #path = "/system/"

  tags = {
    Name = "terratest"
  }
}
resource "aws_iam_user_group_membership" "grp" {
  user = aws_iam_user.nu.name

  groups = [
    aws_iam_group.group1.name,
  ]
}
