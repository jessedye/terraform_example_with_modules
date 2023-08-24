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
