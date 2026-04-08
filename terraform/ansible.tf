resource "local_file" "inventory" {
  content = <<EOF
[ec2]
${module.ec2.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=../path/to/${var.key_name}.pem  

[eks_nodes]
${join("\n", data.aws_instances.eks_nodes.private_ips)} ansible_user=ubuntu ansible_ssh_private_key_file=../path/to/${var.key_name}.pem
EOF

  filename = "../jenkins_deployment/inventory.ini"
}

resource "time_sleep" "wait_for_ec2" {
  depends_on = [module.ec2]

  create_duration = "60s"
}

resource "null_resource" "run_ansible" {
  depends_on = [
    module.ec2,
    module.eks,           
   local_file.inventory
  ]

  provisioner "local-exec" {
    command = "ansible-playbook -i ../jenkins_deployment/inventory.ini ../jenkins_deployment/playbook.yml"
  }
}
