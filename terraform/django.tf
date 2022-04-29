data "aws_route53_zone" "this" {
  # This must be created by hand in the AWS console
  name = "miqaweb.io"
}

data "heroku_team" "this" {
  name = "kitware"
}

module "django" {
  source  = "girder/django/heroku"
  version = "0.10.0"

  project_slug     = "miqa"
  route53_zone_id  = data.aws_route53_zone.this.zone_id
  heroku_team_name = data.heroku_team.this.name
  subdomain_name   = "app"

  django_cors_origin_whitelist = ["https://miqa.miqaweb.io"]
  heroku_app_name              = "miqa-demo"
  heroku_worker_dyno_quantity  = 0
  ec2_worker_instance_type     = "m4.large"
  ec2_worker_instance_quantity = 1
  ec2_worker_ssh_public_key    = var.ec2_worker_ssh_public_key
  ec2_worker_volume_size       = 100
  additional_django_vars = {
    DJANGO_SENTRY_DSN                       = "https://5f3cb898f0164c34ab13c90dfcee4ad4@o267860.ingest.sentry.io/6196580"
    DJANGO_HOMEPAGE_REDIRECT_URL            = "https://miqa.miqaweb.io/"
    DJANGO_DEMO_MODE                        = "true"
    DJANGO_NORMAL_USERS_CAN_CREATE_PROJECTS = "true"
  }
}
