resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidr)
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${element(var.subnet_cidr, count.index)}"
  availability_zone = "${element(var.subnet_azs, count.index)}"

  tags = {
    Name = "${element(var.subnet_name, count.index)}"
  }

}
