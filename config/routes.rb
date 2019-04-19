Rails.application.routes.draw do
  resources :hikes do
  	resources :images
  end

  resources :trails do
		resources :images
  end

  resources :users, only: [:show] do
		resources :images
  end
  

	get '/', to:'sessions#new'
	get '/welcome', to: 'sessions#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'
	get '/auth/failure', to: 'sessions#new'
end
