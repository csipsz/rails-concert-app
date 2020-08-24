Rails.application.routes.draw do

  resources :artists
  resources :comments
  resources :tickets

  resources :concerts, except: [:edit, :update] do 
    resources :comments, only: [:index, :new,  :show]
  end #:create, :destroy, no need for them in nested comments routes

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
  # omniauth callback
  match '*a' => 'concerts#index', via: [:get]
  #this route redirects to my concerts wall in some cases when the url doesn't exist because there is no route for it
  #but I don't think that it is good practice at all

end
