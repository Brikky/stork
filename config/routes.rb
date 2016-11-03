Rails.application.routes.draw do
  get 'sessions/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order_items, :items, :users


  root to: 'items#index'

end
