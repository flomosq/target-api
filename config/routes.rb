Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/users'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :topics, only: :index
      resources :targets, only: :create
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
