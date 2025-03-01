vpc_cidr = "10.0.0.0/16"

pub_sub_cidr = "10.0.1.0/24"

priv_sub_cidr = "10.0.2.0/24"

env = "dev"

ami = "ami-05b10e08d247fb927"

instance_type = "t2.micro"

region = "us-east-1"

list_subnets_config=[
    {
      name                    = "public-subnet-1"
      cidr_block              = "10.0.2.0/24"
      availability_zone       = "us-east-1b"
      map_public_ip_on_launch = true
    },
    {
      name                    = "private-subnet-1"
      cidr_block              = "10.0.3.0/24"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = false

    }
]