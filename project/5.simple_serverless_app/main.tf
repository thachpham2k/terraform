module "serverlessapp" {
  source = "./module/restapi"

  lambda_function = [{
    "function_name"   = "get-function"
    "function_method" = "GET"
    "function_path"   = "${path.root}/lambda_function/getfunction"
    "function_file"   = "index.mjx"
    "handler"         = "index.handler"
    "api_path"        = "/"
    }, {
    "function_name"   = "post-function"
    "function_method" = "POST"
    "function_path"   = "lambda_function/postfunction"
    "function_file"   = "index.mjx"
    "handler"         = "index.handler"
    "api_path"        = "/"
  }]
}