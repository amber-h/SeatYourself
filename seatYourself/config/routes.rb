SeatYourself::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  get 'restaurants/manage', to: 'restaurants#manage_restaurant'

  resources :restaurants do
    resources :reservations, :only => [:create, :new, :index, :destroy]   
  end
  

  resources :restaurants 
  resources :reservations
  resources :users

  resources :sessions

  root :to => "restaurants#index"

end
