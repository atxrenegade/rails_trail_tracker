Rails.application.routes.draw do
  resources :hikes
  resources :trails

  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
