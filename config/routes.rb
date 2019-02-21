Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :categories
  resources :products
  root 'products#index'

  resources :in_shopping_carts, only: [:create, :destroy, :update]

  get '/cart', to: 'shopping_carts#show'
  get '/add/:product_id', as: :add_to_cart, to: 'in_shopping_carts#create'
  get '/checkout', to: 'payments#checkout'
  get '/ok', to: 'home#success'
  # get '/download/:id', to: 'links#download'
  # get '/download/:id/file/:attachment_id', to: 'links#download_attachment', as: :download_attachment
  # get '/invalid', to: 'welcome#unregistered'
  get '/orders', to: 'orders#index'

  post '/pay', to: 'payments#create'
  post 'payments/cards', to: 'payments#process_card'

  get '/about', to: 'home#about'
  get '/terms', to: 'home#terms'
end
