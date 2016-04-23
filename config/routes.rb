Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  resources :surveys, only: [:show] do
    # should really be part of an answer set
    # but that model doesn't yet exist
    resources :answers, only: [:new, :create]
  end
end
