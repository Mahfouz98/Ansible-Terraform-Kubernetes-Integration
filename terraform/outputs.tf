
output "master-node-ip" {
  value = aws_eip.master-eip.public_ip
}

output "worker-node-ip" {
  value = aws_eip.worker-eip.public_ip
}