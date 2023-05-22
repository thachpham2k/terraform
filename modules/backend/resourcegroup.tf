resource "aws_resourcegroups_group" "resourcegroups_group" {
  name = "${var.module_name}-s3-backend"

  resource_query {
    query = <<-JSON
      {
        "ResourceTypeFilters": [
          "AWS::AllSupported"
        ],
        "TagFilters": [
          {
            "Key": "project",
            "Values": ["${var.module_name}"]
          }
        ]
      }
    JSON
  }
}