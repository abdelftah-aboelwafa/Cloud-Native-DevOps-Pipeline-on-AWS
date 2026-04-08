variable "az" {
  default = "eu-central-1a"
}

variable "name" {
  description = "VPC name"
  type        = string
  default     = "my-vpc"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}