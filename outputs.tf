output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "vpc_subnets" {
  value = module.subnets.subnet_id
}

output "db_cluster_instances" {
  value = module.rds-postgres.instance_ids
}

output "db_cluster" {
  value = module.rds-postgres.cluster_id
}

output "db_security_group_id" {
  value = aws_security_group.db_sg.id
}
