# =============================================================================
# CondoCombat — Banco de Dados PostgreSQL (Supabase)
# =============================================================================

resource "supabase_project" "condocombat_db" {
  organization_id   = var.supabase_organization_id
  name              = var.supabase_project_name
  database_password = var.supabase_db_password
  region            = var.supabase_region

  lifecycle {
    ignore_changes = [database_password]
  }
}

locals {
  # String de conexão assíncrona (asyncpg) consumida pelo FastAPI via DATABASE_URL
  database_url = "postgresql+asyncpg://postgres:${var.supabase_db_password}@db.${supabase_project.condocombat_db.id}.supabase.co:5432/postgres"
}
