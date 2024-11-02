resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "ecs-tasks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })
}

resource "aws_iam_role" "ecs_auto_scale_role" {
  name = "ecs_auto_scale_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement: [
      {
        Effect = "Allow"
        Principal: {
          Service: "application-autoscaling.amazonaws.com" 
        }
        Action: "sts:AssumeRole"
      }
    ]
  })
}