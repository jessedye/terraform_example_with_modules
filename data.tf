data "aws_secretsmanager_secret" "secrets" {
  arn = "arn:aws:secretsmanager:us-east-2:729614740176:secret:rds-example-SCIWS6"
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}
