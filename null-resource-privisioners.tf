# Create Null resource

resource "null_resource" "name" {
  connection {
    type        = "ssh"
    host        = aws_eip.bastien_eip.public_ip
    user        = "ec2-user"
    private_key = file("private_key/terraform-key.pem")

  }

  # FILE Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "/private_key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }

  # Remote exec provisioner to change the key.pem permission
  provisioner "remote-exec" {

    inline = ["sudo chmod 400 /tmp/terraform-key"]

  }

  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC id is:  ${module.vpc.vpc_id}  >> /opt/vpc_creation_time.txt"
    #working_dir = ""
    on_failure = continue
  }


  # Creation time provisioner --- all the above are creation time provisioner
  /*
# destroy time provisioners
provisioner "local-exec" {
  command = "echo Destroy `date`   >> destroy.txt"
  #working_dir = "/opt"
  when       = destroy
  on_failure = continue

}
*/
}
