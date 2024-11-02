resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My ECS policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      	{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": "ecs:*",
			"Resource": "*"
		},
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecs:DescribeServices",
                "ecs:UpdateService"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:DescribeAlarms",
                "cloudwatch:PutMetricAlarm"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "ecs-task-execution-attachment" {
  role      = var.ecs_task_execution_role_name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_role_policy_attachment" "ecs-autoscaling-attachment" {
  role      = var.ecs_auto_scale_role_name
  policy_arn = aws_iam_policy.policy.arn
}
