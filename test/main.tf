provider "aws" {
  region = "ap-southeast-1"
}

module "vpc-test" {
  source  = "../modules/vpc"
  
  #vpc cidr = "172.31.0.0/16"
  vpc_id = "vpc-3b04505f"
  private_subnets_cidr = "172.31.48.0/24"
  #private_subnets_cidr = "192.168.1.0/24"

}
