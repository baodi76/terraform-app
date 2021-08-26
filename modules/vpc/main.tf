terraform {
  required_version = ">=0.1.3"
}

/* 
#since used for existing vpc, then not required to create the new VPC. uncomment if need to create the new vpc

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  id = "vpc-fc7d7498"

  # default_security_group_id = "sg-00d7cef66c54466c1"

  tags = var.default_tag
}*/


resource "aws_subnet" "main" {
  #vpc_id     = aws_vpc.main.id
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnets_cidr
  tags = {
    Name = "public"
  }

}
