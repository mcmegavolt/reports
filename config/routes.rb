Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }, :controllers => { :registrations => "users/registrations" }

  resources :reports
  resources :users

  root 'home#index'

end
