# get the current AWS account info
data "aws_caller_identity" "current" {}


# create IAM group
resource "aws_iam_group" "group" {
  name = var.iam_group_name
}

# bind readonly permission to group
resource "aws_iam_group_policy_attachment" "readonly" {
  group      = aws_iam_group.group.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    
}

# create IAM user
resource "aws_iam_user" "user" {
  name    = var.ima_user_name  
}

# add user to group
resource "aws_iam_user_group_membership" "membership" {
  user   = aws_iam_user.user.name
  groups = [aws_iam_group.group.name]
  
}

# create access key for iam user
resource "aws_iam_access_key" "user_key" {
  user   = aws_iam_user.user.name
  
}

# conditional create console login profile
resource "aws_iam_user_login_profile" "user_profile" {
  count   = var.create_login_profile ? 1 : 0
  user    = aws_iam_user.user.name
  pgp_key = var.pgp_key
  password_reset_required = true
  
}

