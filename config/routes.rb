Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'home/', to: 'pages#home'

  resources :users, only: %i[index show destroy] do
    resources :posts
  end

  namespace :admin do
    get 'support/', to: 'pages#support'
    resources :contact_messages, only: %i[index new create edit]
  end
end
