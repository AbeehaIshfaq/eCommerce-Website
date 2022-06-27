Rails.application.routes.draw do
  # get 'products/index'
  devise_for :users
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  get 'products/place_order', to: 'products#place_order', as: 'place_order'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :products 
  root 'products#index'
  resources :products
  root to: 'products#index'
  resources :comments
  resources :orders 
  post 'orders/paypal/create_payment'  => 'orders#paypal_create_payment', as: :paypal_create_payment
  post 'orders/paypal/execute_payment'  => 'orders#paypal_execute_payment', as: :paypal_execute_payment
  # root 'product#index'
  post 'orders/paypal/create_subscription'  => 'orders#paypal_create_subscription', as: :paypal_create_subscription
  post 'orders/paypal/execute_subscription'  => 'orders#paypal_execute_subscription', as: :paypal_execute_subscription
end
