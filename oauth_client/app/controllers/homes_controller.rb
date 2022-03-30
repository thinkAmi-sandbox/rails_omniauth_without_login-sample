class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    # アクセストークンを取得する
    authz = Authz.find_by(id: current_user.id)

    @access_token = authz.present? ? authz.access_token : nil
    @memos = nil
    @is_renew = false

    if @access_token.present?
      response = fetch_resource_server

      case response.status
      when 200
        @memos = parse_response_body(response.body)

      when 401
        # アクセストークンが不正の場合、リフレッシュトークンを使って新しいアクセストークンを取得する
        @access_token = renew_access_token(authz)

        new_response = fetch_resource_server
        # アクセストークンをリフレッシュしたとしてもエラーになる可能性はあるが、今回は気にしない
        @memos = parse_response_body(new_response.body)

      else
        # TODO: 本番運用する時は真剣に考えること
        # エラーっぽいので、エラーメッセージを入れておく
        @memos = 'エラーです'
      end
    end
  end

  private def fetch_resource_server
    conn = Faraday.new do |conn|
      conn.request :authorization, 'Bearer', @access_token
    end

    conn.get('http://localhost:3801/api/memos/')
  end

  private def parse_response_body(response_body)
    JSON.parse(response_body)['message']
  end

  private def renew_access_token(authz)
    strategy = OmniAuth::Strategies::MyAs.new(
      nil,
      ENV['CLIENT_ID'],
      ENV['CLIENT_SECRET'],
      )
    client = strategy.client

    token = OAuth2::AccessToken.new(
      client,
      authz.access_token,
      { refresh_token: authz.refresh_token }
    )

    new_credentials = token.refresh!

    authz.update(
      access_token: new_credentials.token,
      refresh_token: new_credentials.refresh_token,
      expires_at: new_credentials.expires_at
    )

    @is_renew = true

    new_credentials.token
  end
end
