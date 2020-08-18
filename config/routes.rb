Rails.application.routes.draw do
  
  resources :concerts, only: [:show, :index] do 
    resources :comments 
  end 

  resources :users, only: [:new, :create, :destroy] do 
    resources :tickets
  end 

  resources :comments
  resources :tickets

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/filter' => 'concerts#filter'
  
  match '/auth/github/callback', to: 'sessions#githubcreate', via: [:get, :post]

  match '*a' => 'concerts#index', via: [:get]
  #this route redirects to my concerts wall in some cases when the url doesn't exist because there is no route for it

end
