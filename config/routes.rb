# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users

  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
