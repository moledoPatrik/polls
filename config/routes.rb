Rails.application.routes.draw do
  devise_for :users
  root 'polls#index'
  resources :polls, only: %i[index show new create edit update destroy] do
    member do
      patch 'start_poll', to: 'polls#start_poll'
    end
    resources :poll_options
  end
end
