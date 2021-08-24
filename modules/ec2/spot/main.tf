terraform {
  required_version = ">=0.1.3"
}


# Request a Spot fleet

/*
resource "aws_spot_fleet_request" "docker_swarm_spot" {
  iam_fleet_role = var.iam_fleet_role
  spot_price     = var.spot_price
  #allocation_strategy = "lowestPrice"
  target_capacity = var.target_capacity
  #valid_until         = "2019-11-04T20:44:20Z"

  launch_specification {
    instance_type = var.instance_type
    ami           = var.ami
    spot_price    = var.spot_price
    #placement_tenancy        = "dedicated"
    #iam_instance_profile_arn = aws_iam_instance_profile.example.arn
    key_name  = var.key_name
    subnet_id = var.subnet_id

    root_block_device {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }

    tags = var.default_tag
  }


}
*/
resource "aws_spot_instance_request" "docker_swarm_spot" {
  ami                         = var.ami
  spot_price                  = var.spot_price
  instance_type               = var.instance_type
  tags                        = var.default_tag
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = var.security_groups
  subnet_id                   = var.subnet_id
  #iam_instance_profile        = "myInstanceRole"
  wait_for_fulfillment = true

  root_block_device {
        tags                  = { 
            Name="${var.volume_size}"
        }
        volume_size           = var.volume_size
        volume_type           = var.volume_type
    }
 
}
