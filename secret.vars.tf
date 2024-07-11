variable "secrets" {
  type = list(object({
    repository      = string           # Name of the repository
    secret_name     = string           # Name of the secret
    encrypted_value = optional(string) # Encrypted value of the secret using the GitHub public key in Base64 format.
    plaintext_value = optional(string) # Plaintext value of the secret to be encrypted
  }))
  description = "manage GitHub Actions secrets within your GitHub repositories."
  default     = [{ repository = null, secret_name = null }]
}
