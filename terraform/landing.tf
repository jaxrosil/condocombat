data "netlify_site" "landing" {
  id = var.netlify_site_id
}

resource "null_resource" "netlify_deploy" {
  triggers = {
    dist_hash = md5(join("", [for f in fileset(var.landing_dist_path, "**") : filesha1("${var.landing_dist_path}/${f}")]))
  }

  provisioner "local-exec" {
    command = "npx --yes netlify-cli deploy --dir=${var.landing_dist_path} --site=${data.netlify_site.landing.id} --auth=${var.netlify_auth_token} --prod"
  }
}

resource "netlify_environment_variable" "public_app_url" {
  site_id = data.netlify_site.landing.id
  key     = "PUBLIC_APP_URL"

  values = [
    {
      value   = var.public_app_url != "" ? var.public_app_url : "https://${render_web_service.frontend.url}"
      context = "production"
    }
  ]
}