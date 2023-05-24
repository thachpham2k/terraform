resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = "/aws/apigateway/${aws_api_gateway_rest_api.apigw.name}"

  retention_in_days = 30
}