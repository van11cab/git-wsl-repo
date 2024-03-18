
resource "aws_security_group" "ec2_webServer_sg" {
  name = "ec2_webServer_sg"
  description= "Only allow specific port connections from own ip-address"
  vpc_id = "vpc-0aa112206f94535bc"

  tags = {
    Name = "ec2_webServer_sg"
    Role = "public"
  }
}

resource "aws_security_group_rule" "public_in"{
  
  for_each = tomap({for inst in local.csv_read: join("", [inst.port, inst.ip_addr]) => inst})
  type = "ingress"
  from_port = each.value.port
  to_port = each.value.port
  protocol = "tcp"

  cidr_blocks = [each.value.ip_addr]
  security_group_id = aws_security_group.ec2_webServer_sg.id
}


resource "aws_security_group_rule" "public_out"{
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.ec2_webServer_sg.id
}