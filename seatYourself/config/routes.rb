SeatYourself::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  get 'restaurants/manage', to: 'restaurants#manage_restaurant'
  get 'reservations/manage', to: 'reservations#manage_reservation'

  resources :restaurants do
    resources :reservations, :only => [:create, :new, :index, :destroy]   
  end
  

  resources :restaurants 
  resources :reservations
  resources :users

  resources :sessions

  root :to => "restaurants#index"

end
