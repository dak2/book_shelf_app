Rails.application.routes.draw do
  resources :libraries
  resources :posts
  resources :books
  resources :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
