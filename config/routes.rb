Rails.application.routes.draw do
  
  resources :concerts, only: [:show, :index] do 
    resources :comments 
  end 

  resources :users do 
    resources :tickets
  end 

  resources :tickets

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/filter' => 'concerts#filter'
  
  match '/auth/github/callback', to: 'sessions#githubcreate', via: [:get, :post]
end
