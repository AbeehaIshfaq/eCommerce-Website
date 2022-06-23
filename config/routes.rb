Rails.application.routes.draw do
  # get 'products/index'
  devise_for :users
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :products 
  root 'home#index'
  resources :products
  root to: 'products#index'
  # root 'product#index'

end
