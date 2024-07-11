resource "github_actions_organization_secret" "secret_name" {
  for_each = {
    for organization_secret in var.organization_secrets :
    organization_secret.secret_name => organization_secret
    if organization_secret.secret_name != null
  }

  secret_name             = each.value.secret_name
  encrypted_value         = each.value.encrypted_value
  plaintext_value         = each.value.plaintext_value
  visibility              = each.value.visibility
  selected_repository_ids = each.value.selected_repository_ids
}
