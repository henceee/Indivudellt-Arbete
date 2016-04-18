Rails.application.routes.draw do
  get 'pages/home'
  
  root 'pages#home'
  devise_for :users,  :path => '',
                      :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
                      :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}
 end
