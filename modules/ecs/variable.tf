
variable "fargate_cpu" {
    description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
    default = "1024"
}

variable "fargate_memory" {
    description = "Fargate instance memory to provision (in MiB)"
    default = "2048"
}
variable "app_count" {
    description = "Number of docker containers to run"
    default = 3
}
variable "app_image" {
    description = "Docker image to run in the ECS cluster"
    default = "femmyte/blog:latest"
}

variable "aws_region" {}
variable "app_port" {}
variable "ecs_tasks_sg" {}
variable "ecs_task_execution_role_arn" {}
variable "ecs-task-execution-role-policy-attachment" {}
variable "private_subnet" {}
variable "aws_alb_target_group" {}
variable "frotend_listener" {}