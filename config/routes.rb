Rails.application.routes.draw do
  get 'sessions/new'

  devise_for :users
  resources :order_items, :items, :charges, :orders
  resources :users, except: [:destroy]

  root to: 'items#index'

end
