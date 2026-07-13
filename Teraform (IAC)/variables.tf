
variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "image_id" {
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_key_name" {
  type = string
}




