require 'omniauth/strategies/my_as'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :my_as,
           ENV['CLIENT_ID'],
           ENV['CLIENT_SECRET'],
           request_path: '/auth/my_as',
           callback_path: '/oauth_callbacks'
end