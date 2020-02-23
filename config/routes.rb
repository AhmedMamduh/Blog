require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  post 'auth_user' => 'authentication#authenticate_user'
  root to: "api/v1/posts#index"
  mount Sidekiq::Web, at: "/sidekiq"

  namespace :api do
    namespace :v1 do
      resources :posts
      resources :tags, only: [:create, :update]
      resources :comments, only: [:create, :update, :destroy]
    end
  end
end