output "kms_keyring_ids" {
  description = "KMS KeyRing IDs"
  value = {
    for k, v in module.kms_keys :
    k => v.keyring_id
  }
}

output "kms_crypto_key_ids" {
  description = "KMS Crypto Key IDs"
  value = {
    for k, v in module.kms_keys :
    k => v.crypto_key_id
  }
}

output "kms_crypto_key_names" {
  description = "KMS Crypto Key Names"
  value = [
    for k, v in module.kms_keys :
    v.crypto_key_name
  ]
}