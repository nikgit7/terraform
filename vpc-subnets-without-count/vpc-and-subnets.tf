resource "aws_vpc" "myfirstvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "main-vpc"
    }
}
resource "aws_subnet" "public1-a" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.0.0/21"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-1-a"
  }
}
resource "aws_subnet" "public2-a" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.8.0/21"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-2-a"
  }
}
resource "aws_subnet" "private1-a" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.16.0/21"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-1-a"
  }
}
resource "aws_subnet" "private2-a" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.24.0/21"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-2-a"
  }
}

resource "aws_subnet" "public1-b" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.32.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public-1-b"
  }
}
resource "aws_subnet" "public2-b" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.48.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public-2-b"
  }
}
resource "aws_subnet" "private1-b" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.64.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-1-b"
  }
}
resource "aws_subnet" "private2-b" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.96.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-2-b"
  }
}

resource "aws_subnet" "public1-c" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.128.0/19"
  availability_zone = "us-east-1c"
  tags = {
    Name = "public-1-c"
  }
}
resource "aws_subnet" "public2-c" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.160.0/19"
  availability_zone = "us-east-1c"
  tags = {
    Name = "public-2-c"
  }
}
resource "aws_subnet" "private1-c" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.192.0/19"
  availability_zone = "us-east-1c"
  tags = {
    Name = "private-1-c"
  }
}
resource "aws_subnet" "private2-c" {
  vpc_id     = aws_vpc.myfirstvpc.id
  cidr_block = "10.0.224.0/19"
  availability_zone = "us-east-1c"
  tags = {
    Name = "private-2-c"
  }
}
