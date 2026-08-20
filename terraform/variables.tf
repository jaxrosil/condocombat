# =============================================================================
# CondoCombat — Variables (Desafio 3)
# =============================================================================

# -----------------------------------------------------------------------------
# Supabase (Banco de Dados PostgreSQL)
# -----------------------------------------------------------------------------
variable "supabase_access_token" {
  description = "Token de acesso pessoal (PAT) da API do Supabase"
  type        = string
  sensitive   = true
}

variable "supabase_organization_id" {
  description = "ID da organização no Supabase"
  type        = string
}

variable "supabase_project_name" {
  description = "Nome do projeto/banco no Supabase"
  type        = string
  default     = "condocombat"
}

variable "supabase_db_password" {
  description = "Senha do usuário postgres do banco Supabase"
  type        = string
  sensitive   = true
}

variable "supabase_region" {
  description = "Região onde o banco Supabase será instanciado"
  type        = string
  default     = "sa-east-1"
}

# -----------------------------------------------------------------------------
# Render (Backend e Frontend)
# -----------------------------------------------------------------------------
variable "render_api_key" {
  description = "Chave de API do Render"
  type        = string
  sensitive   = true
}

variable "render_owner_id" {
  description = "Owner ID (usuário ou time) no Render"
  type        = string
}

variable "render_region" {
  description = "Região de hospedagem dos serviços no Render (ex: oregon, frankfurt)"
  type        = string
  default     = "oregon"
}

variable "render_plan" {
  description = "Plano dos serviços no Render (ex: free, starter)"
  type        = string
  default     = "free"
}

# -----------------------------------------------------------------------------
# Imagens Docker e Configurações da Aplicação
# -----------------------------------------------------------------------------
variable "dockerhub_username" {
  description = "Nome de usuário no DockerHub onde estão as imagens públicas"
  type        = string
}

variable "backend_image_tag" {
  description = "Tag da imagem Docker do backend"
  type        = string
  default     = "latest"
}

variable "frontend_image_tag" {
  description = "Tag da imagem Docker do frontend"
  type        = string
  default     = "latest"
}

variable "backend_secret_key" {
  description = "Secret key para autenticação/sessão na API FastAPI"
  type        = string
  sensitive   = true
}

variable "cors_origins" {
  description = "Origens permitidas para CORS no backend (separadas por vírgula)"
  type        = string
  default     = "*"
}

# -----------------------------------------------------------------------------
# Netlify (Landing Page)
# -----------------------------------------------------------------------------
variable "netlify_auth_token" {
  description = "Personal Access Token da Netlify"
  type        = string
  sensitive   = true
}

variable "netlify_site_name" {
  description = "Nome do site cadastrado na Netlify"
  type        = string
}

variable "netlify_site_id" {
  type        = string
  description = "ID do site na Netlify"
  default     = ""
}

variable "landing_dist_path" {
  description = "Caminho relativo para a pasta dos estáticos compilados da Landing Page"
  type        = string
  default     = "../landing/dist"
}

variable "public_app_url" {
  description = "URL pública da aplicação frontend (opcional; se vazia, utiliza a URL gerada pelo Render)"
  type        = string
  default     = ""
}