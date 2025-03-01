vpc_cidr = "172.0.0.0/16"
pub_sub_cidr = "172.0.1.0/24"
priv_sub_cidr = "172.0.2.0/24"
env = "pro"
ami = "ami-06ee6255945a96aba"
instance_type = "t2.micro"
region = "eu-central-1"

list_subnets_config=[
    {
      name                    = "public-subnet-1"
      cidr_block              = "172.0.2.0/24"
      availability_zone       = "eu-central-1b"
      map_public_ip_on_launch = true
      subnet_type             = "Public" 
    },
    {
      name                    = "private-subnet-1"
      cidr_block              = "172.0.3.0/24"
      availability_zone       = "eu-central-1a"
      map_public_ip_on_launch = false
      subnet_type             = "Private" 

    }
]