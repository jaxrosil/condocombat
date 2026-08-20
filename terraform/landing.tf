resource "null_resource" "netlify_deploy" {
  triggers = {
    dist_hash = md5(join("", [for f in fileset(var.landing_dist_path, "**") : filesha1("${var.landing_dist_path}/${f}")]))
  }

  provisioner "local-exec" {
    command = "npx --yes netlify-cli deploy --dir=${var.landing_dist_path} --site=${var.netlify_site_id} --auth=${var.netlify_auth_token} --prod"
  }
}