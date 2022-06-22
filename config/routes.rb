Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :products 
  root 'home#index'
  resources :products
  root to: 'products#index'
  # root 'product#index'

end
