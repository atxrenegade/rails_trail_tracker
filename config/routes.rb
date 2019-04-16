Rails.application.routes.draw do
  resources :hikes
  resources :trails
  resources :users, only: [:show]

	get '/', to:'sessions#new'

  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'
	get '/auth/failure', to: 'sessions#new'
end
