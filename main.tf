provider "aws" {
    region = "us-west-2"
    access_key = "AKIAWLW3NYRIFOJ5ZLCY"
    secret_key = "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"
}

resource "aws_instance" "apache" {
   ami = "ami-005bdb005fb00e791"
   key_name = "Terraform"
   instance_type = "t2.micro"
   vpc_security_group_ids= ["sg-049ae073"]

   connection {
       type = "ssh"
       user = "ubuntu"
       private_key = "${file("Terraform.pem")}"
   }

   provisioner "remote-exec"{
       inline = ["sudo apt-get update", "sudo apt-get install nginx -y", "sudo service nginx start"]
   }

}