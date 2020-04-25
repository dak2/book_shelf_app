Rails.application.routes.draw do
  devise_for :users
  root 'toppage#index'
  resources :libraries
  resources :posts
  resources :books
  resources :users
end
