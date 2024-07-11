resource "github_actions_secret" "secret_name" {
  for_each = {
    for secret in var.secrets :
    secret.secret_name => secret
    if secret.secret_name != null
  }

  repository      = each.value.repository
  secret_name     = each.value.secret_name
  encrypted_value = each.value.encrypted_value
  plaintext_value = each.value.plaintext_value
}
