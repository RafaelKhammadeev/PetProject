Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'home/', to: 'pages#home'
  get 'support/', to: 'pages#support'

  resources :users, only: %i[index show destroy] do
    resources :posts do
      resources :comments
    end
  end

  resources :feedbacks, except: %i[show]
end
