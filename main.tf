# ==========================================
# ⚙️ AWS PROVIDER & REGION
# ==========================================
provider "aws" {
  region = var.aws_region
}

# ==========================================
# 🛡️ SECURITY GROUP (FIREWALL)
# ==========================================
resource "aws_security_group" "rds_sg" {
  name        = "financial_db_sg"
  description = "Allow inbound traffic for PostgreSQL"

  ingress {
    description = "PostgreSQL Access from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Restrito para a rede interna
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "Production"
    Project     = "Financial-ETL"
  }
}

# ==========================================
# 🗄️ RDS POSTGRESQL INSTANCE
# ==========================================
resource "aws_db_instance" "financial_db" {
  identifier             = "fin-prod-db-01"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "14.7"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false # Segurança máxima: sem IP público

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

