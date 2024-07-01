Rails.application.routes.draw do
  devise_for :users
  root to: 'marketplace#index'
  resources :cart, only: [:update]
  get "up" => "rails/health#show", as: :rails_health_check
end
