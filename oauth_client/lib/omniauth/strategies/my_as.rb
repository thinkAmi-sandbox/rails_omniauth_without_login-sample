require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class MyAs < OmniAuth::Strategies::OAuth2
      option :name, 'my_as'

      option :client_options, {
        site: 'http://localhost:3801',
        authorize_url: '/oauth/authorize',  # 認可エンドポイント
        token_url: '/oauth/token'  # トークンエンドポイント
      }

      # scope=read としてリクエスト
      option :scope, 'read'
    end
  end
end