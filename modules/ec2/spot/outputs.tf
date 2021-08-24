output "spot_request_id" {
  description = "value of spot request id"
  value       = aws_spot_instance_request.docker_swarm_spot.id
}

output "spot_public_ip" {
  description = "spot instance public ipo"
  value       = aws_spot_instance_request.docker_swarm_spot.public_ip
}
