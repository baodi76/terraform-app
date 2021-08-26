variable "default_security_group_id" {
  description = "value of security id"
  type        = string
  default     = "sg-00d7cef66c54466c1"

}

variable "ami" {
  description = "value of ami for instance"
  type        = string
  ### Ubuntu Server 20.04 LTS 
  # for t4g arm : "ami-063fd293c12c6bb5c"
  # for t3g x86 :  ami-0d058fe428540cd89
  # for t3  x86 after install docker/net-tools/tree : ami-0a0c9c737c907aab6
  default = "ami-0a0c9c737c907aab6"

}

variable "instance_type" {
  description = "value of instance type"
  type        = string
  default     = "t3.small"
  #"t4g.small"

}

variable "spot_price" {
  description = "spot bid max price"
  type        = string
  # "0.0064" for t4g.small
  # "0.0040" for t3.micro
  # "0.0079" for t3.small
  default = "0.0079"

}

variable "instance_count" {
  description = "number of instances is required"
  type        = number
  default     = 3

}

variable "volume_size" {
  description = "disk size in G"
  type        = string
  default     = "10"

}

