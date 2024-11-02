variable "az_count" {
    description = "Number of AZs to cover in a given region"
    default = "2"
}
variable "aws_ecs_service_name" {}
variable "aws_ecs_cluster_name" {}
variable "ecs_auto_scale_role_arn" {}