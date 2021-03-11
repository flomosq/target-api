Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount_devise_token_auth_for 'User', at: 'api/v1/users'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :topics, only: :index
      resources :targets, only: %i[index create destroy]
      resources :contacts, only: :create
      get 'about', to: 'general_info_items#about'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
