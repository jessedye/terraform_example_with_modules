module "vpc" {
    source        = "./modules/vpc"

    cidr_block = var.cidr_block
    tenancy = var.tenancy
    name_tag      = var.name_tag

}

module "subnets" {
    source        = "./modules/vpc-subnet"

    subnet_azs = var.subnet_azs
    subnet_cidr = var.subnet_cidr
    vpc_id = module.vpc.vpc_id
    subnet_name = var.subnet_name

}

module "rds-postgres" {
    source        = "./modules/rds-postgres"

    username = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["USERNAME"]
    password = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["PASSWORD"]

    engine = var.engine
    engine_version = var.engine_version
    database_name = var.database_name
    instance_class = var.instance_class
    cluster_identifier = var.cluster_identifier

    instance_number = var.instance_number
    instance_name = var.instance_name
    db_subnet_group_name = var.db_subnet_group_name

}

