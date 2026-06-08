variable "ima_user_name" {
  description = "The name of IAM user"
  type        = string
}

variable "iam_group_name" {
  description = "The group of this IAM user belong"
  type        = string
  default     = "devops"
}

variable "pgp_key" {
  description = "The PGP public key or keybase:username used to encrypt the console password"
  type        = string
}

variable "create_login_profile" {
  description = "Whether create console login for this user"
  type        = bool
}

