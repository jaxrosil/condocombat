output "database_project_id" {
  description = "ID do projeto Supabase provisionado"
  value       = supabase_project.condocombat_db.id
}

output "database_url" {
  description = "String de conexão do PostgreSQL (asyncpg)"
  value       = local.database_url
  sensitive   = true
}

output "backend_url" {
  description = "URL pública do backend FastAPI no Render"
  value       = "https://${render_web_service.backend.url}"
}

output "frontend_url" {
  description = "URL pública do frontend Next.js no Render"
  value       = "https://${render_web_service.frontend.url}"
}

output "landing_url" {
  description = "URL pública da Landing Page na Netlify"
  value       = "https://${var.netlify_site_name}.netlify.app"
}

output "landing_site_id" {
  description = "ID do site na Netlify"
  value       = var.netlify_site_id
}