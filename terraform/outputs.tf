resource "local_file" "inventory" {
    content = <<EOT
    [${aws_instance.jenkins_service.tags.AnsibleHostname}]
    ${aws_instance.jenkins_service.public_ip}

    [${aws_instance.vault_service.tags.AnsibleHostname}]
    ${aws_instance.vault_service.public_ip}
    EOT
    filename = "myinventory.ini"
}

resource "local_file" "template_effect" {
    content = jsonencode(local.csv_read)
    filename = "sec.txt"
}
