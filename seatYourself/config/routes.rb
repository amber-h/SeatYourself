SeatYourself::Application.routes.draw do
  get "reviews/show"

  get "reviews/new"

  get "reviews/edit"

  # The priority is based upon order of creation:
  # first created -> highest priority.
  get 'restaurants/manage', to: 'restaurants#manage_restaurant'
  get 'reservations/manage', to: 'reservations#manage_reservation'

  resources :restaurants do
    resources :reservations, :only => [:create, :new, :index, :destroy, :edit, :update]   
    resource :reviews, :except => [:index]
  end
  
  resources :restaurants 
  resources :reservations
  resources :users

  resources :sessions

  root :to => "restaurants#index"

end
