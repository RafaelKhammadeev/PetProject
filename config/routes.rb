Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: "users#index"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "home/", to: "pages#home"
  get "support/", to: "pages#support"

  resources :users, only: %i[index show destroy]
  resources :feedbacks, only: %i[index new edit create update destroy]

  resources :posts do
    resources :comments
  end

  get "/:page" => "pages#show", as: :pages
end
