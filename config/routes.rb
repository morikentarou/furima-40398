Rails.application.routes.draw do
  root 'items#index'
  resources :tiems
end
