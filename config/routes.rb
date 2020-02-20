Rails.application.routes.draw do
  devise_for :users
  post 'auth_user' => 'authentication#authenticate_user'
  root to: "api/v1/posts#index"

  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
end
