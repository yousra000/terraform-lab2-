resource "aws_route_table" "priv_route" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "priv-route"
  }
}


resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.priv_route.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}