data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_python.py"
  output_path = "lambda_python.zip"
}

resource "aws_lambda_function" "terraform_lambda_function" {
  function_name = "lambda_function"
  handler       = "lambda_python.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_role.arn
  filename      = "${data.archive_file.lambda.output_path}"
  #depends_on    = [aws_iam_role_policy_attachment.lambda-attach]
}



