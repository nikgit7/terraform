resource "aws_vpc" "testapp" {
  cidr_block           = "10.0.0.0/16"
  tags = {
    Name = "test"
  }
}

resource "aws_subnet" "testapp_public_subnet" {
 
  count = 2

  availability_zone       = var.availability_zones[count.index]
  cidr_block              = var.public_subnets_cidr[count.index]
  vpc_id                  = aws_vpc.testapp.id

}

resource "aws_subnet" "testapp_private_subnet" {

  count = 2

  availability_zone = var.availability_zones[count.index]
  cidr_block        = var.private_subnets_cidr[count.index]
  vpc_id            = aws_vpc.testapp.id

}

resource "aws_internet_gateway" "testapp_internet_gateway" {
  vpc_id = aws_vpc.testapp.id

  tags = {
    Name = "testapp-internet-gateway"
  }
}

resource "aws_route_table" "testapp_route_table" {
  vpc_id = aws_vpc.testapp.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testapp_internet_gateway.id
  }
  tags = {
    Name = "testapp-public-custom-rtb"
  }
}

resource "aws_route_table_association" "testapp-custom-rtb-public-subnet" {
  count          = 2
  route_table_id = aws_route_table.testapp_route_table.id
  subnet_id      = aws_subnet.testapp_public_subnet.*.id[count.index]
}
