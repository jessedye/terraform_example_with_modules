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
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1c"]
}

variable "subnet_cidr" {
  type    = list(string)
  default = ["10.90.46.0/27", "10.90.46.32/27", "10.90.46.64/27", "10.90.46.224/27"]
}

variable "vpc_id" {
  type = string
  default = "vpc-123"
}

variable "subnet_name" {
  type    = list(string)
  default = ["subnet_1", "subnet_2", "subnet_3", "subnet_4"]
}
