data "archive_file" "lambda_file" {
  count = length(var.lambda_function)

  type        = "zip"
  source_dir  = var.lambda_function[count.index].function_path
  output_path = "${var.lambda_function[count.index].function_path}/${var.lambda_function[count.index].function_name}_payload.zip"
}

resource "aws_lambda_function" "lambda_function" {
  count = length(var.lambda_function)

  filename      = "${var.lambda_function[count.index].function_path}/${var.lambda_function[count.index].function_name}_payload.zip"
  function_name = "${var.project_name}-${var.lambda_function[count.index].function_name}"
  role          = aws_iam_role.lambda-iam_role.arn
  handler       = var.lambda_function[count.index].handler

  source_code_hash = data.archive_file.lambda_file[count.index].output_base64sha256

  runtime = "nodejs18.x"

  tags = var.project_tags
}