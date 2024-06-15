Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :purchases, only: [:create, :index]
  end
end
