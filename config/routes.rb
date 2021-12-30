Rails.application.routes.draw do
  root 'root#index'

  get 'signup', to: 'users#new'
  post 'signin', to: 'logins#create'
  delete 'signout', to: 'logins#destroy'

  resources :users, only: [:create] do
    scope module: 'users' do
      resources :todos, only: [:create, :destroy]
    end
  end

  match '*path', to: 'root#not_found', via: :all
end
