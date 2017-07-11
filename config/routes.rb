Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :products
  resources :order_products

  # resource :cart, only: [:show]

end
