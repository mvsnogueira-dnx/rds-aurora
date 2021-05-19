variable "identifier" {
  type = string
  description = "Name of this cluster Instances"
}

variable "environment_name" {
  type = string
  description = "Environment name to use as a prefix to this DB"
}

variable "allow_security_group_ids" {
  type = list
  description = "List of Security Group IDs to allow connection to this DB:"
  default = []
}

variable "allow_cidrs" {
  type = list
  default = []
  description = "List of CIDRs to allow connection to this DB"
}

variable "master_username" {
  type = string
  description = "DB User"
}

variable "database_name" {
  type = string
  description = "DB name"
}
variable "retention" {rm 
  type = number
  description = "Snapshot retention period in days"
}

variable "instance_class" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "port" {
  type = number
}

variable "parameter_group_name" {
  type = string
}

variable "db_cluster_parameter_group_name" {
  type = string
  default = ""
}

variable "db_subnet_group_name" {
  type = string
  default = ""
}
variable "apply_immediately" {
  type = bool
  default = true
}

variable "deletion_protection" {
  type = bool
  default = true
}
variable "publicly_accessible" {
  type = bool
  default = false
}

variable "snapshot_identifier" {
  type = string
  default = ""
}

variable "engine_mode" {
  type = string
  default = ""
}

variable "backup_retention_period" {
  type = string
  default = "5"
}

variable "storage_encrypted" {
  type = bool
  description = "Enables storage encryption"
}

variable "kms_key_arn" {
  type = string
  default = ""
  description = "KMS Key ARN to use a CMK instead of default shared key, when storage_encrypted is true"
}

variable "backup" {
  type = bool
  description = "Enables automatic backup with AWS Backup"
}

variable "vpc_id" {
  type = string
}

variable "db_subnet_group_id" {
  type = string
}

variable "preferred_backup_window" {
  type = string
  default = ""
}

variable "preferred_maintenance_window" {
  type = string
  default = ""
}

variable "performance_insights_enabled" {
  type = bool
  description = "Enables or not performance_insights"
  default = false
}

variable "availability_zones" {
  type = list
  description = "A list of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created"
}

variable "cluster_identifier" {
  type = string
  default = ""
}