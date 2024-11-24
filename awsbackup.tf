provider "aws" {
  region = "us-east-2" # Replace with your desired region
}

# Backup Vault
resource "aws_backup_vault" "example" {
  name = "example-backup-vault"
}

# Backup Plan
resource "aws_backup_plan" "example" {
  name = "example-backup-plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.example.name
    schedule          = "cron(0 12 * * ? *)" # Daily at 12:00 UTC
    lifecycle {
      delete_after = 30 # Retain backups for 30 days
    }
  }
}
