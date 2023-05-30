Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users

  resources :users, only: %i[index show destroy] do
    resources :posts
  end
end
