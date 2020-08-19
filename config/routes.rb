Rails.application.routes.draw do

  resources :artists
  resources :comments
  resources :tickets

  resources :concerts, only: [:show, :index, :new, :create] do 
    resources :comments, only: [:index, :new, :create, :destroy, :show]
  end 

  resources :users, only: [:new, :create, :destroy] do 
    resources :tickets
  end 

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/artistlogin' => 'sessions#newartist'
  post '/artistlogin' => 'sessions#createartist'
  delete '/logout' => 'sessions#destroy'

  get '/filter' => 'concerts#filter'
  
  match '/auth/github/callback', to: 'sessions#githubcreate', via: [:get, :post]

  match '*a' => 'concerts#index', via: [:get]
  #this route redirects to my concerts wall in some cases when the url doesn't exist because there is no route for it

end
