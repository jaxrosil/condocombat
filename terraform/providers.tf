terraform {
  required_version = ">= 1.10.0"

  required_providers {
    supabase = {
      source  = "supabase/supabase"
      version = "~> 1.10"
    }
    render = {
      source  = "render-oss/render"
      version = "~> 1.9"
    }
    netlify = {
      source  = "netlify/netlify"
      version = "~> 0.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "supabase" {
  access_token = var.supabase_access_token
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}

provider "netlify" {
  token           = var.netlify_auth_token
  default_team_id = var.netlify_team_id
}