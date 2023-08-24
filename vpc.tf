module "vpc" {
    source        = "./modules/vpc"

    cidr_block = var.cidr_block
    tenancy = var.tenancy
    name_tag      = var.name_tag

}