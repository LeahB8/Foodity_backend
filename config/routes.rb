Rails.application.routes.draw do

  post '/signin', to: 'users#signin'
  get '/validate', to: 'users#validate'
  post '/users', to: 'users#signup'

  resources :reviews
  resources :bookings
  resources :wishlists
  resources :favourites
  resources :restaurants
  resources :users

end
