# terraform-lab2-
restructure your code to use variables ,-create all subnets with single resource using for_each,make condition,  create two environments one in us-east-1 and eu-central-1 with create two workspaces dev and prod , and all ec2s with single resource using count, map_public_ip_on_launch,on subnet resource based on type (public or private) to control ,
run local-exec provisioner to print the public_ip of bastion ec2
create rds(mysql) in private subnet
create elastic cache redis in private subnet
