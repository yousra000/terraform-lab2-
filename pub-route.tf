resource "aws_route_table" "pub_route" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "pub-route"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.pub_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id

}
