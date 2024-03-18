resource "aws_instance" "jenkins_service" {
  ami           = "ami-08f7912c15ca96832"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_webServer_sg.id]

  tags = {
    Name = "Jenkins Service"
    AnsibleHostname = "jenkins"
  }
}


resource "aws_instance" "vault_service" {
  ami           = "ami-08f7912c15ca96832"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_webServer_sg.id]

  tags = {
    Name = "Vault Service"
    AnsibleHostname = "vault"
  }
}
