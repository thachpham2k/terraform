variable "project_name" {
  default = "serverlessapp"
}

variable "project_tags" {
  type = map(string)
  default = {
    "author" : "terraform"
    "purpose" : "serverless app"
  }
}

variable "lambda_function" {
  type = list(map(any))
  default = [{
    "function_name"   = "get-function"
    "function_method" = "GET"
    "function_path"   = "lambda_function/getfunction"
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

variable "apigw_stage_name" {
  default = "v1"
}
