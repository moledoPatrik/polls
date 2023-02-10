Rails.application.routes.draw do
  root 'polls#index'
  resources :polls, only: %i[index show new create edit update destroy]
end
