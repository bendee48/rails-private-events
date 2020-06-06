Rails.application.routes.draw do
  get 'users/login', to: 'user_sessions#new'
  post 'users/create', to: 'user_sessions#create'
  get 'users/logout', to: 'user_sessions#destroy'
  resources :users, only: [:new, :create, :show]
end
