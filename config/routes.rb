Rails.application.routes.draw do
  
  resources :users, controller: "users" do
  end
  resources :pins, controller: "pins" do
    member do
    put "like", to: "pins#upvote"
  end

  end
  get    '/search',  to: 'users#search'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root "welcome#index"


  end
