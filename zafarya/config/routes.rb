Rails.application.routes.draw do

  root 'pages#home'
  devise_for :users,  :path => '',
                      :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
                      :controllers => { :omniauth_callbacks => 'omniauth_callbacks',
                                        :registrations=>'registrations'     
                                       }
                      
  resources :users, only: [:show]
  resources :adventures
  resources :photos
  resources :activity_dates
  resources :time_slots
  
  resources :adventures do 
    resources :reservations, only: [:create]
  end
  
  resources :adventures do 
    resources :reviews, only: [:create, :destroy]
  end
  
  get '/preload' => 'reservations#preload'
  get '/stimes' => 'reservations#stimes'
  get '/etimes' => 'reservations#etimes'
  
  get '/your_adventures' => 'reservations#your_adventures'
  get '/your_reservations' => 'reservations#your_reservations'
  post '/notify' => 'reservations#notify'
  post '/your_adventures' => 'reservations#your_adventures'
  
 end
