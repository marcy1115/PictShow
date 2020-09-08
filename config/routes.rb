Rails.application.routes.draw do
  devise_for :users

  root 'arts#index'
  resources :arts, only: [:index, :new]
end
