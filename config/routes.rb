Rails.application.routes.draw do
  get 'sessions/new'

  devise_for :users, :controllers => {:sessions => "users/sessions",:registrations => "registrations/registrations"}
  resources :order_items, except: [:show]
  resources :orders, except: [:index, :show, :edit]
  resources :items, only: [:show]
  resources :users, except: [:destroy]
  resources :charges, only: [:new, :create]

  root to: 'items#index'

end
