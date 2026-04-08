variable "vpc_id" {
  description = "VPC ID where the instance will be launched"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "web"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.large"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default       = "ami-0dba2cb6798deb6d8"  # Ubuntu 24.04 LTS latest for us-east-1
}

variable "is_private" {
  description = "Boolean: true if EC2 should be in private subnet"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}