#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster

resource "aws_rds_cluster" "cluster" {
  engine                    = var.engine
  engine_version            = var.engine_version
  cluster_identifier        = var.cluster_identifier
  master_username           = var.username
  master_password           = var.password
  database_name             = var.database_name
  db_subnet_group_name      = var.db_subnet_group_name
}

resource "aws_rds_cluster_instance" "instance" {
  count = var.instance_number
  engine               = var.engine
  engine_version       = var.engine_version
  identifier           = "${var.instance_name}-${count.index}"
  cluster_identifier   = aws_rds_cluster.cluster.id
  instance_class       = var.instance_class
  db_subnet_group_name = var.db_subnet_group_name
}
