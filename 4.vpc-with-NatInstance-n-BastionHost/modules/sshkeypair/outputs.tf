# Đối với dữ liệu nhạy cảm để có thể sử dụng output có thể dùng 2 cách sau 
output "sshkeypairpublic" {
  value     = tls_private_key.sshkey.public_key_pem
  sensitive = true
  # Sau đó dùng lệnh `terraform output -raw sshkeypairpublic` để xem 
}

output "sshkeypaiprivate" {
  value = nonsensitive(tls_private_key.sshkey.private_key_pem)
}

output "sshkeypair-name" {
  value = aws_key_pair.sshkeypair.key_name
}