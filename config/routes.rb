Rails.application.routes.draw do

  post '/signin', to: 'users#signin'
  get '/validate', to: 'users#validate'
  post '/signup', to: 'users#signup'
  get '/profile', to: 'users#show'

  resources :reviews
  resources :bookings
  resources :wishlists
  resources :favourites
  resources :restaurants
  resources :users

end
