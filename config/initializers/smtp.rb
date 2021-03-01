ActionMailer::Base.smtp_settings = {
  domain: ENV['SERVER_HOST'],
  address: ENV['SMTP_ADDRESS'],
  port: ENV['SMTP_PORT'],
  authentication: :plain,
  user_name: ENV['SMTP_USER_NAME'],
  password: ENV['SENDGRID_API_KEY']
}
