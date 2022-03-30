class OauthCallbacksController < ApplicationController
  def index
    # AS兼RSアプリから受け取ったクレデンシャル情報を取得
    credentials = request.env['omniauth.auth'].credentials

    # クレデンシャル情報をモデルに保存
    authz = Authz.find_or_initialize_by(id: current_user.id) do |a|
      a.user = current_user
    end

    authz.update(
      access_token: credentials.token,
      refresh_token: credentials.refresh_token,
      expires_at: credentials.expires_at
    )

    # 処理が終わったらルートにリダイレクト
    redirect_to root_path
  end
end