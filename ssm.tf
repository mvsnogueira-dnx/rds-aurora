resource "aws_ssm_parameter" "rds_db_password" {
  name        = "/rds/${var.environment_name}-${var.identifier}/PASSWORD"
  description = "RDS Password"
  type        = "SecureString"
  value       = random_string.rds_db_password.result

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "rds_db_user" {
  name        = "/rds/${var.environment_name}-${var.identifier}/USER"
  description = "RDS User"
  type        = "SecureString"
  value       = aws_rds_cluster.rds_cluster.master_username
}

resource "aws_ssm_parameter" "rds_endpoint" {
  name        = "/rds/${var.environment_name}-${var.identifier}/ENDPOINT"
  description = "RDS Endpoint"
  type        = "String"
  value       = aws_rds_cluster.rds_cluster.endpoint
}

resource "aws_ssm_parameter" "rds_db_name" {
  name        = "/rds/${var.environment_name}-${var.identifier}/NAME"
  description = "RDS DB Name"
  type        = "String"
  value       = aws_rds_cluster.rds_cluster.database_name
}
