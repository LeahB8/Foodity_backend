Rails.application.routes.draw do

  post '/signin', to: 'users#signin'
  get '/validate', to: 'users#validate'
  post '/signup', to: 'users#signup'
  get '/profile', to: 'users#show'
  get '/users/:id/favourites', to: 'users#favourites'
  get '/users/:id/wishlists', to: 'users#wishlists'
  get '/users/:id/bookings', to: 'users#bookings'

  resources :reviews
  resources :bookings
  resources :wishlists
  resources :favourites
  resources :restaurants
  resources :users

end
