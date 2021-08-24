output "vpc_id" {
  value = module.vpc_test.subnet_output.cidr_block
  description = "value of VPC id"
}

output "spot_instance_public_ip" {
  value = module.spot_instance.spot_public_ip
  description = "value of spot public ip"
}


output "spot_request_id" {
  value = module.spot_instance.spot_request_id
  description = "value of spot request id"
}

output "spot_instance_2_public_ip" {
  value = module.spot_instance.spot_public_ip
  description = "value of spot public ip"
}


output "spot_request_2_id" {
  value = module.spot_instance.spot_request_id
  description = "value of spot request id"
}