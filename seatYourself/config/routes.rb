SeatYourself::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :restaurants do
    resources :reservations, :only => [:create, :new, :index, :destroy]  
  
  end
  
  root :to => "restaurants#index"

end
