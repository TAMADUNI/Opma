Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :sites
  resources :regions
  resources :departments
  root "home#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

resources :handovers do
  post 'accept', on: :member
  post 'reject', on: :member
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
