Rails.application.routes.draw do
  devise_for :users

  root 'arts#index'
  resources :arts, only: [:index, :new] do
    collection do
      post 'new', to: "arts#create"
    end
  end
  
end
