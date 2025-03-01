
resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.subnets["public-subnet-1"].id
  route_table_id = aws_route_table.pub_route.id
}


resource "aws_route_table_association" "priv-association" {
  subnet_id      = aws_subnet.subnets["private-subnet-1"].id
  route_table_id = aws_route_table.priv_route.id
}
