Rails.application.routes.draw do
  root 'posts#index'
  get '/libraries', to: 'libraries#index'
  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :libraries
  resources :posts
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
