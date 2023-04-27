resource "aws_internet_gateway" "ig1" {
  vpc_id = aws_vpc.myfirstvpc.id

  tags = {
    Name = "ig-1"
  }
}
resource "aws_route_table" "public1-a" {
  vpc_id = aws_vpc.myfirstvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }
}
resource "aws_route_table_association" "associate1-a" {
  subnet_id = aws_subnet.public1-a.id
  route_table_id = aws_route_table.public1-a.id
}

resource "aws_route_table" "public2-a" {
  vpc_id = aws_vpc.myfirstvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }
}
resource "aws_route_table_association" "associate2-a" {
  subnet_id = aws_subnet.public2-a.id
  route_table_id = aws_route_table.public2-a.id
}


resource "aws_route_table" "public1-b" {
  vpc_id = aws_vpc.myfirstvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }
}
resource "aws_route_table_association" "associate1-b" {
  subnet_id = aws_subnet.public1-b.id
  route_table_id = aws_route_table.public1-b.id
}

resource "aws_route_table" "public2-b" {
  vpc_id = aws_vpc.myfirstvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }
}
resource "aws_route_table_association" "associate2-b" {
  subnet_id = aws_subnet.public2-b.id
  route_table_id = aws_route_table.public2-b.id
}


resource "aws_route_table" "public1-c" {
  vpc_id = aws_vpc.myfirstvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }
}
resource "aws_route_table_association" "associate1-c" {
  subnet_id = aws_subnet.public1-c.id
  route_table_id = aws_route_table.public1-c.id
}

resource "aws_route_table" "public2-c" {
  vpc_id = aws_vpc.myfirstvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }
}
resource "aws_route_table_association" "associate2-c" {
  subnet_id = aws_subnet.public2-c.id
  route_table_id = aws_route_table.public2-c.id
}
