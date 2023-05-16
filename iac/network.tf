resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = "Transit Gateway"

  tags = {
    Name = "MyTransitGateway"
  }
}

# Attach VPC A to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "attachment_a" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.vpc_a.id
  subnet_ids         = [aws_subnet.vpc_a_subnet.id]
}

# Attach VPC B to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "attachment_b" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.vpc_b.id
  subnet_ids         = [aws_subnet.vpc_b_subnet.id]
}

# Attach VPC C to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "attachment_c" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.vpc_c.id
  subnet_ids         = [aws_subnet.vpc_c_subnet.id]
}
# Create VPC A
resource "aws_vpc" "vpc_a" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block
}

# Create VPC B
resource "aws_vpc" "vpc_b" {
  cidr_block = "10.1.0.0/16"  # Replace with your desired CIDR block
}

# Create VPC C
resource "aws_vpc" "vpc_c" {
  cidr_block = "10.2.0.0/16"  # Replace with your desired CIDR block
}

# Create subnets in VPC A, VPC B, and VPC C
resource "aws_subnet" "vpc_a_subnet" {
  vpc_id     = aws_vpc.vpc_a.id
  cidr_block = "10.0.1.0/24"  # Replace with your desired CIDR block
}

resource "aws_subnet" "vpc_b_subnet" {
  vpc_id     = aws_vpc.vpc_b.id
  cidr_block = "10.1.1.0/24"  # Replace with your desired CIDR block
}

resource "aws_subnet" "vpc_c_subnet" {
  vpc_id     = aws_vpc.vpc_c.id
  cidr_block = "10.1.2.0/24"  # Replace with your desired CIDR block
}

# Create Internet Gateway for VPC A
resource "aws_internet_gateway" "igw_a" {
  vpc_id = aws_vpc.vpc_a.id
}

# Create Internet Gateway for VPC B
resource "aws_internet_gateway" "igw_b" {
  vpc_id = aws_vpc.vpc_b.id
}

# Create Internet Gateway for VPC C
resource "aws_internet_gateway" "igw_c" {
  vpc_id = aws_vpc.vpc_c.id
}

# Create Route Tables for VPC A, VPC B, and VPC C
resource "aws_route_table" "rt_a" {
  vpc_id = aws_vpc.vpc_a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_a.id
  }
}

resource "aws_route_table" "rt_b" {
  vpc_id = aws_vpc.vpc_b.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_b.id
  }
}

resource "aws_route_table" "rt_c" {
  vpc_id = aws_vpc.vpc_c.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_c.id
  }
}

# Associate Route Tables with Subnets
resource "aws_route_table_association" "rta_a" {
  subnet_id      = aws_subnet.vpc_a_subnet.id
  route_table_id = aws_route_table.rt_a.id
}

resource "aws_route_table_association" "rta_b" {
  subnet_id      = aws_subnet.vpc_b_subnet.id
  route_table_id = aws_route_table.rt_b.id
}

resource "aws_route_table_association" "rta_c" {
subnet_id = aws_subnet.vpc_c_subnet.id
route_table_id = aws_route_table.rt_c.id
}


