provider "aws" {
  region = "ap-southeast-1"
}

module "vpc_test" {
  source = "../modules/vpc"

  #vpc cidr = "172.31.0.0/16"
  vpc_id               = "vpc-3b04505f"
  private_subnets_cidr = "172.31.120.0/24"
  #private_subnets_cidr = "192.168.1.0/24"

}

module "spot_instance" {
  source = "../modules/ec2/spot"
  count  = var.instance_count

  #ami               = "ami-077adae4d983338da"
  ami             = var.ami
  spot_price      = var.spot_price
  subnet_id       = module.vpc_test.subnet_output.id
  security_groups = [var.default_security_group_id]
  instance_type   = var.instance_type
  # default size is 8G
  volume_size     = var.volume_size

}

/*
module "spot_instance_2" {
  source = "../modules/ec2/spot"

  ami             =  var.ami
  spot_price      = var.spot_price
  subnet_id       = module.vpc_test.subnet_output.id
  security_groups = [var.default_security_group_id]
  instance_type = var.instance_type

}*/

# for  security group  rules
resource "aws_security_group_rule" "sg_rule-1" {
  description = "swarm ingress rules-1"
  type        = "ingress"
  from_port   = -1
  to_port     = -1
  protocol    = "all"
  cidr_blocks = [module.vpc_test.subnet_output.cidr_block]
  # ["0.0.0.0/0"]
  #ipv6_cidr_blocks  = ["::/0"]
  security_group_id = var.default_security_group_id
}

# for  security group  rules
resource "aws_security_group_rule" "sg_rule-5001" {
  description = "swarm ingress rules-2"
  type        = "ingress"
  from_port   = "5001"
  to_port     = "5001"
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  # ["0.0.0.0/0"]
  #ipv6_cidr_blocks  = ["::/0"]
  security_group_id = var.default_security_group_id
}

# for  security group  rules ==${module.spot_instance.spot_request_id}
resource "aws_security_group_rule" "sg_rule-spot-public-node" {
  count             = var.instance_count
  description       = "swarm ingress public IP rules-${count.index + 1}"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "all"
  cidr_blocks       = ["${module.spot_instance[count.index].spot_public_ip}/32"]
  security_group_id = var.default_security_group_id
}

/*
# for  security group  rules ==${module.spot_instance.spot_request_id}
resource "aws_security_group_rule" "sg_rule-spot-public-node-2" {
  description       = "swarm ingress public IP rules-2"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "all"
  cidr_blocks       = ["${module.spot_instance[1].spot_public_ip}/32"]
  security_group_id = var.default_security_group_id
}
*/

