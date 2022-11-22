data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_synthetics_canary" "main" {
  name                 = "cp-canary-${var.canary_name}"
  artifact_s3_location = "s3://${var.canary_bucket}/canary/${var.canary_name}"
  execution_role_arn   = aws_iam_role.canary.arn
  zip_file             = "/tmp/canary_zip_inline.zip"
  runtime_version      = "syn-nodejs-puppeteer-3.8"
  handler              = "apiCanaryBlueprint.handler"

  run_config {
    active_tracing     = true
    timeout_in_seconds = 60
  }

  schedule {
    expression = "rate(5 minutes)"
  }
}

data "archive_file" "canary_zip_inline" {
  type        = "zip"
  output_path = "/tmp/canary_zip_inline.zip"

  source {
    content = templatefile("${path.module}/canary_node.tmpl", {
      endpointpath = var.endpointpath
      hostname     = var.hostname
      port         = var.port
    })
    filename = "nodejs/node_modules/apiCanaryBlueprint.js"
  }
}
