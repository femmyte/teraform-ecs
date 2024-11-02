resource "aws_ecs_cluster" "main" {
    name = "femmyte-cluster"
}

data "template_file" "cb_app" {
    template = file("./templates/ecs/app.json.tpl")

    vars = {
        app_image      = var.app_image
        app_port       = var.app_port
        fargate_cpu    = var.fargate_cpu
        fargate_memory = var.fargate_memory
        aws_region     = var.aws_region
    }
}

resource "aws_ecs_task_definition" "app" {
    family                   = "femmyte-app-task"
    execution_role_arn       = var.ecs_task_execution_role_arn
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = var.fargate_cpu
    memory                   = var.fargate_memory
    container_definitions    = data.template_file.cb_app.rendered
}

resource "aws_ecs_service" "main" {
    name            = "femmyte-service"
    cluster         = aws_ecs_cluster.main.id
    task_definition = aws_ecs_task_definition.app.arn
    desired_count   = var.app_count
    launch_type     = "FARGATE"

    network_configuration {
        security_groups  = [var.ecs_tasks_sg]
        subnets          = var.private_subnet
        assign_public_ip = true
    }

    load_balancer {
        target_group_arn = var.aws_alb_target_group
        container_name   = "femmyte-app"
        container_port   = var.app_port
    }

    depends_on = [var.frotend_listener, var.ecs-task-execution-role-policy-attachment]
}