Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'homes#index'

  # OAuth2.0のリダイレクトエンドポイント用
  resources :oauth_callbacks, only: [:index]
end
