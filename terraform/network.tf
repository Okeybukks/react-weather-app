resource "aws_vpc" "weather-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Weather VPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.weather-vpc.id
  count                   = length(var.availability_zones)
  cidr_block              = var.cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[count.index]

  tags = {
    Name = "Subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.weather-vpc.id

  tags = {
    Name = "weather-RT"
  }
}

resource "aws_route_table" "weather-RT" {
  vpc_id = aws_vpc.weather-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "weather-RT"
  }
}

resource "aws_route_table_association" "a" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.main[count.index].id
  route_table_id = aws_route_table.weather-RT.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.weather-vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}