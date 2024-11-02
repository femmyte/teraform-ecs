output "ecs_task_execution_role_name" {
    value = aws_iam_role.ecs_task_execution_role.name
}
output "ecs_task_execution_role_arn" {
    value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_auto_scale_role_name" {
    value = aws_iam_role.ecs_auto_scale_role.name
}
output "ecs_auto_scale_role_arn" {
    value = aws_iam_role.ecs_auto_scale_role.arn
}