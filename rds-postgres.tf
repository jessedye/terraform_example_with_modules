
module "rds-postgres" {
    source        = "./modules/rds-postgres"

    username = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["USERNAME"]
    password = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["PASSWORD"]

    engine = var.db_engine
    engine_version = var.db_engine_version
    database_name = var.db_database_name
    instance_class = var.db_instance_class
    cluster_identifier = var.db_cluster_identifier

    instance_number = var.db_instance_number
    instance_name = var.db_instance_name
    db_subnet_group_name = var.db_subnet_group_name
    subnets = module.subnets.subnet_id
    vpc_security_group_ids = [aws_security_group.db_sg.id]

}

