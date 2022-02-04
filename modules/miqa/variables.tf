variable "environment" {
  type        = string
  description = "A dash-separated name for this particular deployment."
}

variable "heroku_team_name" {
  type = string
}
variable "route53_zone_id" {
  type = string
}

variable "logging_url" {
  type        = string
  description = "The credentialed URL to send logs to."
  sensitive   = true
}
