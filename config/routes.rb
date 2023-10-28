Rails.application.routes.draw do
  devise_for :users
  resources :attends
  get 'start_time_task', to: 'attends#start_time_task'
  get 'stop_time_task', to: 'attends#stop_time_task'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
