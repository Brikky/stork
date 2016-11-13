Rails.application.routes.draw do
  get 'sessions/new'

  devise_for :users, :controllers => {:sessions => "users/sessions"}
  resources :order_items, except: [:show]
  resources :orders, except: [:edit, :update]
  resources :items, only: [:show]
  resources :users, except: [:destroy]
  resources :charges, only: [:new, :create]

  root to: 'items#index'

  get "/about", to: "pages#show" , as:"about"

end
