resource "aws_network_acl" "acl_a" {
vpc_id = aws_vpc.vpc_a.id

egress {
protocol = "-1"
from_port = 0
to_port = 0
action = "allow"
rule_no = 100
cidr_block = "0.0.0.0/0"
}

ingress {
protocol = "6" # TCP
from_port = 22
to_port = 22
action = "allow"
rule_no = 100
cidr_block = "0.0.0.0/0"
}
}



resource "aws_network_acl" "acl_b" {
vpc_id = aws_vpc.vpc_b.id

egress {
protocol = "-1"
from_port = 0
to_port = 0
action = "allow"
rule_no = 100
cidr_block = "0.0.0.0/0"
}

ingress {
protocol = "6" # TCP
from_port = 22
to_port = 22
action = "allow"
rule_no = 100
cidr_block = "0.0.0.0/0"
}
}

resource "aws_network_acl" "acl_c" {
vpc_id = aws_vpc.vpc_c.id

egress {
protocol = "-1"
from_port = 0
to_port = 0
action = "allow"
rule_no = 100
cidr_block = "0.0.0.0/0"
}

ingress {
protocol = "6" # TCP
from_port = 22
to_port = 22
action = "allow"
rule_no = 100
cidr_block = "0.0.0.0/0"
}
}
resource "aws_security_group" "instance_sg_a" {
  name        = "instance-sg"
  description = "Security group for EC2 instances"
  vpc_id = aws_vpc.vpc_a.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow ICMP from anywhere
  }
}
resource "aws_security_group" "instance_sg_b" {
  name        = "instance-sg"
  description = "Security group for EC2 instances"
  vpc_id = aws_vpc.vpc_b.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow ICMP from anywhere
  }
}
resource "aws_security_group" "instance_sg_c" {
  name        = "instance-sg"
  description = "Security group for EC2 instances"
  vpc_id = aws_vpc.vpc_c.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow ICMP from anywhere
  }
}