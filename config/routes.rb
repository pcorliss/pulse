Rails.application.routes.draw do
  root 'surveys#index'

  get '/heartbeat', to: 'heartbeat#show'

  resources :surveys, only: [:show, :index] do
    resources :answers, only: [:new, :create]
  end
end
