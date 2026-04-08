resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }

  user_data = templatefile("${path.module}/install.sh", {})

    # Public IP only if not private
  associate_public_ip_address = var.is_private ? false : true
 
}
