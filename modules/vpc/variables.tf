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
