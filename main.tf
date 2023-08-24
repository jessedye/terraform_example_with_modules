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

resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "db security group"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "postgres VPC"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block]
  }

  ingress {
    description      = "mysql VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block]
  }  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "db-sg"
  }
}


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
