provider "vault" {
  address         = "https://vault-internal.pappik.online"
  skip_tls_verify = true
  token           = var.vault_token
}