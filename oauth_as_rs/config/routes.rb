Rails.application.routes.draw do
  use_doorkeeper
  devise_for :members

  namespace :api do
    resources :memos, only: [:index]
  end
end
