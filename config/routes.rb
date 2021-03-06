Rails.application.routes.draw do
  namespace :api do
      scope :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'
      end
    end
  devise_for :users
  match '/users', to: 'users#index', via: 'get'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items
  end
end
