Rails.application.routes.draw do
  devise_for :users

  root 'arts#index'
  resources :users, only: [:new]
  resources :arts, only: [:index]
end
