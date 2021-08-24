variable "default_security_group_id" {
  description = "value of security id"
  type        = string
  default     = "sg-00d7cef66c54466c1"

}

variable "ami" {
    description = "value of ami for instance"
    type = string
    default = "ami-063fd293c12c6bb5c"
  
}

