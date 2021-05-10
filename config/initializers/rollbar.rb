Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']
  config.enabled = Rails.env.production?
  config.environment = ENV['ROLLBAR_ENV'].presence || Rails.env
end
