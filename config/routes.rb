Rails.application.routes.draw do
  root 'products#index'

  resources :products
  resources :order_products

  resource :cart, only: [:show]

end
