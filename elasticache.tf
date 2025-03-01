resource "aws_security_group" "sg_redis" {
  name_prefix = "redis-sg"
  description = "Security group for Elasticache Redis"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "my-elasticache-subnet-group"
  subnet_ids = [aws_subnet.subnets["private-subnet-1"].id] 

  tags = {
    Name = "My ElastiCache Subnet Group"
  }
}

resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = "my-redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro" 
  num_cache_nodes      = 1
  subnet_group_name    = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids   = [aws_security_group.sg_redis.id] 
  port                 = 6379
  parameter_group_name = "default.redis5.0"

  tags = {
    Name = "My Redis Cluster"
  }
}
