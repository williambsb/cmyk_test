Rails.application.routes.draw do
  root :to => 'products#index'
  get 'home', to: 'home#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products
  # resources :sessions, only: %w[show] do
  #   get 'cart', to: 'carts#show'
  # end
  resources :carts
  resources :line_items
  resources :images

  post 'cart_line_items', to: 'line_items#create_from_cart'
end
