Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'

  # post 'users', to: 'users#new'
  # resources :users, only: [ :create]
  resources :users, except: [:new]
  # resources :articles, onqly: [:show, :index, :new, :create, :edit, :update, :destroy]
  # the same as the above
  resources :articles

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
end
