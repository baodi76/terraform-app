
variable "vpc_id" {
  description = "value of vpc_id"
  type        = string
  default     = "vpc-fc7d7498"

}
variable "private_subnets_cidr" {
  description = "value of private subnet cidr"
  type        = string
  default     = "10.0.12.0/24"

}

variable "default_subnet_id" {
  description = "value of subnet id"
  type        = string
  default     = "sg-00d7cef66c54466c1"

}
variable "default_tag" {
  description = "value of default tag"
  type        = map(string)
  default     = {
    Name="docker-swarm"
    Terraform   = "true"
    Environment = "test"
  }
}
