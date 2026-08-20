# =============================================================================
# CondoCombat — Backend (FastAPI) no Render, a partir da imagem DockerHub
# =============================================================================

resource "render_web_service" "backend" {
  name   = "condocombat-backend"
  plan   = var.render_plan
  region = var.render_region

  runtime_source = {
    image = {
      image_url = "docker.io/${var.dockerhub_username}/condocombat-backend"
      tag       = var.backend_image_tag
    }
  }

  env_vars = {
    DATABASE_URL = { value = local.database_url }
    SECRET_KEY   = { value = var.backend_secret_key }
    CORS_ORIGINS = { value = var.cors_origins }
  }

  health_check_path = "/health"

  depends_on = [supabase_project.condocombat_db]
}
