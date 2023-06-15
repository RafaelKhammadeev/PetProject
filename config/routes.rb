Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users

  get 'main/', to: 'main_page#index'

  resources :users, only: %i[index show destroy] do
    resources :posts
  end

  namespace :admin do
    resources :contacts
  end
end
