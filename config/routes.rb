Rails.application.routes.draw do
  root 'sessions#new'
  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'
  get '/songs' => 'songs#index'
  post '/songs' => 'songs#create'
  get '/songs/:id' => 'songs#show'
  post '/playlists' => 'playlists#create'
  resources :users
end
