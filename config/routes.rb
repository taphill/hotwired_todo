Rails.application.routes.draw do
  root 'root#index'

  post 'signin', to: 'sessions#create'
  get 'signup', to: 'users#new'

  resources :users, only: [:create]
  resources :sessions, only: [:destroy]
end
