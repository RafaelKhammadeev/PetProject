Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: "users#index"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "home/", to: "pages#home"
  get "support/", to: "pages#support"

  resources :feedbacks, only: %i[index new edit create update destroy]

  resources :users, only: %i[index show] do
    resources :posts
  end
end
