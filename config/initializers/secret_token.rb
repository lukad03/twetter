Twetter::Application.config.secret_token = if Rails.env.development? or Rails.env.test?
else
  ENV['SECRET_TOKEN']
end
