Rails.application.routes.draw do
  get 'sessions/new'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" , :sessions => 'users/sessions' }

  devise_scope :user do
    delete 'log_out', :to => 'devise/sessions#destroy', :as => :facebook_logout
  end

  resources :order_items, :items, :charges, :orders
  resources :users, except: [:destroy]

  root to: 'items#index'
end
