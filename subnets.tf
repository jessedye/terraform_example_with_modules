module "subnets" {
    source        = "./modules/vpc-subnet"

    subnet_azs = var.subnet_azs
    subnet_cidr = var.subnet_cidr
    vpc_id = module.vpc.vpc_id
    subnet_name = var.subnet_name

}