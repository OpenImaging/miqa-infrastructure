terraform {
  backend "remote" {
    organization = "kitware"

    workspaces {
      name = "miqa"
    }
  }
}

provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = ["267194242802"]
  # Must set AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY envvars
}

provider "heroku" {
  # Must set HEROKU_EMAIL, HEROKU_API_KEY envvars
}

resource "aws_route53_zone" "this" {
  name = "app.miqaweb.io"
}

module "miqa_demo" {
  source           = "../modules/miqa"
  heroku_team_name = "kitware"
  route53_zone_id  = aws_route53_zone.this.zone_id
}
