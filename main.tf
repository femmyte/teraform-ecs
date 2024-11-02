module "CloudWatch" {
  source = "./modules/cloudwatch"
}
module "ecs" {
  source = "./modules/ecs"
  app_port = var.app_port
  aws_region = var.aws_region
  ecs_tasks_sg = module.security.ecs_tasks_sg
  ecs_task_execution_role_arn = module.roles.ecs_task_execution_role_arn
  ecs-task-execution-role-policy-attachment = module.policy.ecs-task-execution-role-policy-attachment
  private_subnet = module.network.private_subnets
  aws_alb_target_group = module.elb.aws_alb_target_group
  frotend_listener = module.elb.frotend_listener
}
module "elb" {
  source = "./modules/elb"
  app_port = var.app_port
  vpc_id = module.network.vpc_id
  public_subnet = module.network.public_subnets
  lb_sg = module.security.lb_sg
}
module "network" {
  source = "./modules/network"
  aws_ecs_cluster_name = module.ecs.aws_ecs_cluster_name
  aws_ecs_service_name = module.ecs.aws_ecs_service_name
  ecs_auto_scale_role_arn = module.roles.ecs_auto_scale_role_arn
}
module "security" {
  source = "./modules/security"
  app_port = var.app_port
  vpc_id = module.network.vpc_id
}

module "roles" {
  source = "./modules/roles"
}
module "policy" {
  source = "./modules/policy"
  ecs_task_execution_role_name = module.roles.ecs_task_execution_role_name
  ecs_auto_scale_role_name = module.roles.ecs_auto_scale_role_name
}