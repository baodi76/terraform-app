variable "instance_type" {
  description = "value of instance type"
  type        = string
  default     = "t4g.micro"
}

variable "ami" {
  description = "value of ami"
  type        = string
}

variable "spot_price" {
  description = "value of spot price"
  type        = string
}

variable "target_capacity" {
  description = "number of spot request"
  type        = number
  default     = 1

}

variable "key_name" {
  description = "value of ssociation key"
  type        = string
  default     = "docker-swarm"
}

variable "subnet_id" {
  description = "value of subnet_id"
  type        = string
}
variable "volume_size" {
  description = "volume size"
  type        = string
  default     = "8"
}

variable "volume_type" {
  description = "volume type"
  type        = string
  default     = "gp2"
}

variable "iam_fleet_role" {
  description = "iam fleet role"
  type        = string
  default     = "arn:aws:iam::902275624112:user/multi-docker"

}

variable "security_groups" {
  description = "list of security groups"
  type        = list(string)
  
}

variable "default_tag" {
  description = "value of default tag"
  type        = map(string)
  default = {
    Name        = "docker-swarm"
    Terraform   = "true"
    Environment = "test"
    Type        = "spot"
  }
}
