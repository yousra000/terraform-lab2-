resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.subnets["private-subnet-1"].id] 

  tags = {
    Name = "DBGroup"
  }
}

resource "aws_db_instance" "mysql_instance" {
  identifier        = "my-mysql-db"
  engine            = "mysql"
  engine_version    = "8.0" 
  instance_class    = "db.t2.micro" 
  db_name           = "mydatabase"
  username          = "admin"
  password          = "mysecretpassword"
  allocated_storage = 20
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name 
  multi_az          = false
  storage_encrypted = true
  publicly_accessible = false 
  backup_retention_period = 7
  vpc_security_group_ids = [aws_security_group.sg_vpc_cidr_only.id] 
  tags = {
    Name = "MySQL"
  }
}
