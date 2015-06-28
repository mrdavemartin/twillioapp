# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ivrsystem::Application.initialize!

if Rails.env.development? || Rails.env.test?
  ENV['twillo_account_sid'] = 'xxx' #eid for numnber 44 020 33229948
  ENV['twillo_auth_token'] = '' #currently have no auth token
  ENV['yammer_client_id'] = 'xxx'
  ENV['yammer_client_secret'] = 'xxx'
  ENV['yammer_redirect_uri'] = 'https://3b52f011.ngrok.com/yammer_auth/new'
end

