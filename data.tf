data "aws_secretsmanager_secret" "secrets" {
  arn = ""
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}
