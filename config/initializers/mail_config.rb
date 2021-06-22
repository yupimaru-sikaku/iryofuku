# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#   address: 'smtp.gmail.com',
#   domain: 'gmail.com',
#   port: 587,
#   user_name: ENV['gmail_address'],
#   password: ENV['gmail_password'],
#   authentication: 'plain',
#   enable_starttls_auto: true
# }

mail = ENV['gmail_address']
pass = ENV['gmail_application_password']   
config.action_mailer.delivery_method = :smtp
config.action_mailer.raise_delivery_errors = true
config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "smtp.gmail.com",
  authentication: "plain",
  user_name: mail,
  password: pass,
  enable_starttls_auto: true
}