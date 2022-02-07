module "miqa" {
  source  = "girder/django/heroku"
  version = "0.10.0"

  project_slug   = "miqa"
  subdomain_name = var.environment
  route53_zone_id  = var.route53_zone_id
  heroku_team_name = var.heroku_team_name
  # The following require globally unique names
  heroku_app_name         = "miqa-demo"
  storage_bucket_name     = "miqa-demo-storage"
  heroku_postgresql_plan  = "standard-0"
  heroku_cloudamqp_plan   = "tiger"
  heroku_web_dyno_size    = "standard-1x"
  heroku_worker_dyno_size = "standard-2x"
}
