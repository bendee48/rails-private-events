Rails.application.routes.draw do
  root 'events#index'
  get 'users/login', to: 'user_sessions#new'
  post 'users/create', to: 'user_sessions#create'
  get 'users/logout', to: 'user_sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :new, :create, :show]
  resources :event_attendances, only: [:new, :create]
end
