Rails.application.routes.draw do
  root 'root#index'

  get 'signup', to: 'users#new'
  post 'signin', to: 'logins#create'
  delete 'signout', to: 'logins#destroy'

  resources :users, only: [:create]
end
