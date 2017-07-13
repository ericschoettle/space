Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'products#index'

  resources :products
  resources :order_products
  resources :charges

  # resource :cart, only: [:show]

end
