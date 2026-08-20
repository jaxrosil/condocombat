# =============================================================================
# CondoCombat — Frontend (Next.js) no Render, a partir da imagem DockerHub
# =============================================================================

resource "render_web_service" "frontend" {
  name   = "condocombat-frontend"
  plan   = var.render_plan
  region = var.render_region

  runtime_source = {
    image = {
      image_url = "docker.io/${var.dockerhub_username}/condocombat-frontend"
      tag       = var.frontend_image_tag
    }
  }

  env_vars = {
    NEXT_PUBLIC_API_URL = { value = "https://${render_web_service.backend.url}" }
  }

  depends_on = [render_web_service.backend]
}
