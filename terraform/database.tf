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
  # String de conexão assíncrona (asyncpg) via Supabase Connection Pooler (compatível com IPv4 no Render)
  database_url = "postgresql+asyncpg://postgres.${supabase_project.condocombat_db.id}:${var.supabase_db_password}@aws-0-${var.supabase_region}.pooler.supabase.com:6543/postgres"
}