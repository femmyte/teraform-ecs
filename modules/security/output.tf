output "ecs_tasks_sg" {
    value = aws_security_group.ecs_tasks.id
}
output "lb_sg" {
    value = aws_security_group.lb.id
}