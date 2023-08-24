variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "database_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "cluster_identifier" {
  type = string
}

variable "db_subnet_group_name" {
  type = string
}

variable "instance_number" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "subnets" {
  type    = list(string)
}

variable "vpc_security_group_ids" {
  type    = list(string)
}
