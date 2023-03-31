Rails.application.routes.draw do
  resources :reviews
  resources :users
  resources :addresses
  resources :visit_events
  resources :purchase_orders
  resources :po_items
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
end
