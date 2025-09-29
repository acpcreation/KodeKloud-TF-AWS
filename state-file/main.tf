resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-aplattel"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

data "aws_secretsmanager_secret_version" "database_password" {
  secret_id = "my-database-password-aplattel"
}

resource "aws_db_instance" "my_secret_db" {
  identifier        = "rds-db-instance"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0.43"
  instance_class    = "db.t3.micro"
  username          = "admin"
  password          = data.aws_secretsmanager_secret_version.database_password.secret_string  # Using the retrieved secret value
}