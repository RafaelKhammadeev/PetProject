Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users

  get '/posts', to: 'posts#index'

  resources :users, only: %i[index show destroy] do
    namespace :users do
      resources :posts
    end
  end
end
