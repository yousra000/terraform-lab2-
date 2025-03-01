variable "vpc_cidr" {
  type = string
}

variable "pub_sub_cidr" {
  type = string
}

variable "priv_sub_cidr" {
  type = string
}

variable "env" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type = string
}

variable "list_subnets_config" {
  type = list(object({
    name                    = string
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool

  }))
}