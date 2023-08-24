##VPC Vars

variable "cidr_block" {
  type        = string
  description = "VPC CIDR Block"
  default = "10.0.0.0/16"
}

variable "tenancy" {
  type        = string
  description = "VPC Tenancy"
  default = "default"
}

variable "name_tag" {
  type        = string
  description = "VPC Name"
  default = "example_module_vpc"
}

##Subnet variables

variable "subnet_azs" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c", "us-east-2c"]
}

variable "subnet_cidr" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_id" {
  type = string
  default = "vpc-123"
}

variable "subnet_name" {
  type    = list(string)
  default = ["subnet_1", "subnet_2", "subnet_3", "subnet_4"]
}

## DB Postgres Vars

variable "db_engine" {
  type = string
  default = "aurora-postgresql"
}

variable "db_engine_version" {
  type = string
    default = "11.9"
}

variable "db_database_name" {
  type = string
   default = "example_db"
}

variable "db_instance_class" {
  type = string
  default = "db.t3.medium"
}

variable "db_cluster_identifier" {
  type = string
  default = "example-cluster"
}

variable "db_subnet_group_name" {
  type = string
  default = "postgres_db_subnet_group"
}

variable "db_instance_number" {
  type = string
  default = 2
}

variable "db_instance_name" {
  type = string
  default = "pg-instance"
}
