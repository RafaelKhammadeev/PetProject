Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
