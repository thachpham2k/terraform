# resource "aws_cognito_user_pool" "cognito" {
#   name = "${var.project-name}-cognito"
#   tags = var.project-tags

#   username_attributes = ["email"]

#   password_policy {
#     minimum_length = 6
#   }

#   mfa_configuration          = "OFF"

#   account_recovery_setting {
#     recovery_mechanism {
#       name     = "verified_email"
#       priority = 1
#     }
#   }

#   auto_verified_attributes = ["email"]

#   email_configuration {
#     email_sending_account = "COGNITO_DEFAULT"
#   }

# }

# resource "aws_cognito_user_pool_domain" "domain" {
#   domain          = "${var.project-name}5332"
#   user_pool_id    = aws_cognito_user_pool.cognito.id
# }

# resource "aws_cognito_user_pool_client" "client" {
#   name                                 = "${var.project-name}-client"
#   user_pool_id                         = "${aws_cognito_user_pool.cognito.id}"
#   generate_secret                      = false
#   allowed_oauth_flows_user_pool_client = true
#   allowed_oauth_flows                  = ["code", "implicit"]
#   supported_identity_providers         = ["COGNITO"]
#   explicit_auth_flows = ["ALLOW_CUSTOM_AUTH", "ALLOW_ADMIN_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH",
#   "ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_SRP_AUTH"]
#   callback_urls                        = ["${aws_api_gateway_deployment.apideploy.invoke_url}"]
#   allowed_oauth_scopes                 = ["email", "openid", "phone"]

#   depends_on = [
#     aws_cognito_user_pool.cognito
#   ]
# }

# resource "aws_api_gateway_authorizer" "authorizer" {
#   name          = "${var.project-name}-authorizer"
#   type          = "COGNITO_USER_POOLS"
#   rest_api_id   = "${aws_api_gateway_rest_api.apigw.id}"
#   provider_arns = ["${aws_cognito_user_pool.cognito.arn}"]
# }