variable "organization_secrets" {
  type = list(object({
    secret_name             = string                 # Name of the secret
    encrypted_value         = optional(string)       # Encrypted value of the secret using the GitHub public key in Base64 format.
    plaintext_value         = optional(string)       # Plaintext value of the secret to be encrypted
    visibility              = string                 # Configures the access that repositories have to the organization secret. Must be one of all, private, selected.
    selected_repository_ids = optional(list(string)) # An array of repository ids that can access the organization secret.
  }))
  description = "manage GitHub Actions secrets within your GitHub repositories."
  default     = [{ secret_name = null, visibility = null }]
}
