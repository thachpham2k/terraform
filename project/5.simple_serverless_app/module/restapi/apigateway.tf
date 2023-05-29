resource "aws_api_gateway_rest_api" "apigw" {
  name        = "${var.project_name}-api_gateway"
  description = "API gateway"
  tags        = var.project_tags
}

# resource "aws_api_gateway_resource" "api_gateway-resource" {
#   rest_api_id = "${aws_api_gateway_rest_api.apigw.id}"
#   parent_id   = "${aws_api_gateway_rest_api.apigw.root_resource_id}"
#   path_part   = "{proxy+}"
# }

# ====================== ROOT path directory

resource "aws_api_gateway_method" "root" {
  count = length(var.lambda_function)

  rest_api_id = aws_api_gateway_rest_api.apigw.id
  resource_id = aws_api_gateway_rest_api.apigw.root_resource_id

  http_method   = var.lambda_function[count.index].function_method
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "root-method_integration" {
  count = length(var.lambda_function)

  rest_api_id = aws_api_gateway_rest_api.apigw.id
  resource_id = aws_api_gateway_rest_api.apigw.root_resource_id

  http_method = aws_api_gateway_method.root[count.index].http_method

  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = aws_lambda_function.lambda_function[count.index].invoke_arn
}

resource "aws_api_gateway_method_response" "root-method_response" {
  count = length(var.lambda_function)

  rest_api_id = aws_api_gateway_rest_api.apigw.id
  resource_id = aws_api_gateway_rest_api.apigw.root_resource_id
  http_method = aws_api_gateway_integration.root-method_integration[count.index].http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "root-method_integration_response" {
  count = length(var.lambda_function)

  rest_api_id = aws_api_gateway_rest_api.apigw.id
  resource_id = aws_api_gateway_rest_api.apigw.root_resource_id
  http_method = aws_api_gateway_method_response.root-method_response[count.index].http_method
  status_code = aws_api_gateway_method_response.root-method_response[count.index].status_code

  response_templates = {
    "application/json" = ""
  }
}

resource "aws_lambda_permission" "root-method" {
  count = length(var.lambda_function)

  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function[count.index].function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.apigw.execution_arn}/*/${var.lambda_function[count.index].function_method}/"
}

# ==============================================
# ===================== Deploy
# ==============================================

resource "aws_api_gateway_deployment" "apigw-deployment" {
  rest_api_id = aws_api_gateway_rest_api.apigw.id
  stage_name  = var.apigw_stage_name

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.apigw.body))
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_api_gateway_integration.root-method_integration,
    aws_api_gateway_integration_response.root-method_integration_response,
    aws_lambda_permission.root-method
  ]
}

resource "aws_api_gateway_stage" "apigw-stage" {
  depends_on = [aws_cloudwatch_log_group.cloudwatch_log_group]

  stage_name = aws_api_gateway_deployment.apigw-deployment.stage_name
}

resource "aws_api_gateway_method_settings" "apigw-method_settings" {
  rest_api_id = aws_api_gateway_rest_api.apigw.id
  stage_name  = aws_api_gateway_deployment.apigw-deployment.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled    = true
    data_trace_enabled = true
    logging_level      = "INFO"
  }
}