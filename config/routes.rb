Rails.application.routes.draw do
  root 'surveys#index'

  resources :surveys, only: [:show, :index] do
    resources :answers, only: [:new, :create]
  end
end
