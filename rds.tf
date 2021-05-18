resource "random_string" "rds_db_password" {
  length  = 34
  special = false
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                   = var.count
  identifier              = "${var.environment_name}-${var.identifier}-${count.index}"
  cluster_identifier      = aws_rds_cluster.rds_cluster.id
  
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  publicly_accessible     = var.publicly_accessible
  db_subnet_group_name    = var.db_subnet_group_id
  db_parameter_group_name = var.parameter_group_name
  apply_immediately       = var.apply_immediately
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  performance_insights_enabled  = var.performance_insights_enabled 
  }


resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier = "${var.environment_name}-${var.identifier}"
  availability_zones = var.availability_zones
  database_name      = var.database_name
  backup_retention_period = var.retention
  master_username    = var.master_username
  master_password    = random_string.rds_db_password.result
  apply_immediately  = var.apply_immediately
  db_cluster_parameter_group_name  = var.db_cluster_parameter_group_name
  db_subnet_group_name = var.db_subnet_group_id
  deletion_protection = var.deletion_protection
  engine_mode = var.engine_mode
  engine_version = var.engine_version
  engine = var.engine
  snapshot_identifier = var.snapshot_identifier != "" ? var.snapshot_identifier : null
  kms_key_id  = var.kms_key_arn
  storage_encrypted = var.storage_encrypted
  port = var.port
  preferred_backup_window = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  skip_final_snapshot  = true
  vpc_security_group_ids  = list(aws_security_group.rds_db.id)
}
