# keypair
resource "tls_private_key" "sshkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "sshkeypair" {
  key_name   = "${var.project-name}-keypair"
  public_key = tls_private_key.sshkey.public_key_openssh
}

resource "local_file" "name" {
  file_permission = "0400"
  content         = tls_private_key.sshkey.private_key_pem
  filename        = "${path.module}/${var.project-name}-keypair.pem"
}