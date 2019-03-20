Rails.application.routes.draw do
  resources :bicycle_shops, only: [:index]
  devise_for :users, controllers: {
    'omniauth_callbacks': 'users/omniauth_callbacks'
  }
  
  resources :events, only: [:index, :show] do
    resources :comments, only: [:create,:destroy]
  end
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :in_shopping_carts, only: [:create, :destroy, :update]

  root 'products#index'

  # Admin routes
  namespace :admin do
    resources :users
    resources :categories
    resources :events
    resources :my_payments
    resources :products

    root "products#index"
  end
  

  get '/cart', to: 'shopping_carts#show'
  get '/add/:product_id', as: :add_to_cart, to: 'in_shopping_carts#create'
  get '/checkout', to: 'payments#checkout'
  get '/ok', to: 'home#success'
  # get '/download/:id', to: 'links#download'
  # get '/download/:id/file/:attachment_id', to: 'links#download_attachment', as: :download_attachment
  # get '/invalid', to: 'welcome#unregistered'
  get '/orders', to: 'orders#index'
  get '/about', to: 'home#about'
  get '/terms', to: 'home#terms'

  post '/pay', to: 'payments#create'
  post 'payments/cards', to: 'payments#process_card'

  post '/events/:id/attend', to: 'events#attend', as: :attend

  post '/custom_sign_up', to: 'users/omniauth_callbacks#custom_sign_up'
end
