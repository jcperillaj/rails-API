Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  # config.navigational_formats = [:json]
  # config.secret_key = 'bcc80ea13e0d73c9cdfb423b93f703123287a3a60ebeb9721cdbc402d28cea1fa66288ac1cc2bc5033e544208f053e95e896b7500cfe9f24906e9ef5f8780e20'
  # config.authentication_keys = [:email, :nickname]
end
