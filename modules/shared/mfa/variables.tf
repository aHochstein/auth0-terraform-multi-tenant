variable "mfa_policy" {
  type = object({
    webauthn      = bool
    email         = bool
    otp           = bool
    recovery_code = bool
  })
}