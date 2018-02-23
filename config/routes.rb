Rails.application.routes.draw do
  get 'main/index'
  match ':controller/:action', :via => :get
  root 'main#index'
  resources :users
  resources :sessions
  get "/donate", to: "main#donate"
  get "/register", to: "users#index"
  get "/login", to: "sessions#new"
  get "/dashboard", to: "sessions#dashboard"
  post "/sessions/update", to: "sessions#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
