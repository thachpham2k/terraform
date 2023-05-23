resource "null_resource" "create_file" {
  provisioner "local-exec" {
    when    = create
    command = "echo '' > list_files.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf list_files.txt"
  }
}
resource "aws_s3_bucket_object" "object" {
  # for_each     = fileset(path.module, "static-web/**/*")
  for_each = var.src_path != null ? fileset(var.src_path, "**") : toset([])

  provisioner "local-exec" {
    command = "echo ${each.value} >> list_files.txt"
  }

  bucket = aws_s3_bucket.s3_bucket.id
  # key          = replace(each.value, "static-web", "")
  key          = each.value
  source       = "${var.src_path}/${each.value}"
  etag         = filemd5("${var.src_path}/${each.value}")
  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])

  depends_on = [null_resource.create_file]
}