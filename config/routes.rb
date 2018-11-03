Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :products
  root 'products#index'

  resources :in_shopping_carts, only: [:create, :destroy, :update]

  get '/cart', to: 'shopping_carts#show'
  get '/add/:product_id', as: :add_to_cart, to: 'in_shopping_carts#create'
end
