data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}


locals{
  csv_read = csvdecode(data.template_file.csv_read.rendered)
}

data "template_file" "csv_read" {
  template = "${file("csv_template.sh.tpl")}"
  vars ={
    own_ip = "${data.external.myipaddr.result.ip}/32"
  }
}
