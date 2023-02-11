Rails.application.routes.draw do
  devise_for :users
  root 'polls#index'
  resources :polls, only: %i[index show new create edit update destroy]
end
