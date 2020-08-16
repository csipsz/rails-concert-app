Rails.application.routes.draw do
  resources :users

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  match '/auth/github/callback', to: 'sessions#githubcreate', via: [:get, :post]
end
