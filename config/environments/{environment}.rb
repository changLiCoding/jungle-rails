config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  user_name:            'your_email@gmail.com',
  password:             'your_password',
  authentication:       'plain',
  enable_starttls_auto: true
}
config.action_mailer.default_url_options = { host: 'localhost:3000' } # replace with your app's URL
