resource "aws_lambda_function" "lambda1" {
  filename      = "lambda/lambda_ssm.zip"
  function_name = "exceute_ssm_on_isntance"
  role          = "${aws_iam_role.generateLambdaRoles.arn}"
  handler       = "lambda_function.lambda_handler"
  source_code_hash = "${filebase64sha256("lambda/lambda_ssm.zip")}"
  runtime = "python3.8"
  timeout = 60
    environment {
    variables = {
      instanceId = "${aws_instance.launchEC2.id}"
    }
  }
}