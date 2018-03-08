Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'
  get 'about', to: 'pages#about'
  get 'ticket_file', to: 'pages#ticket_file'
  get 'profile', to: 'users#profile'
  get 'edit_first_name', to:'users#edit_first_name'
  get 'edit_last_name', to: 'users#edit_last_name'
  get 'edit_email', to: 'users#edit_email'
  get 'edit_bio', to: 'users#edit_bio'
  get 'edit_profile_pic', to: 'users#edit_profile_pic'

  resources :events, only: [:index, :show, :create, :new] do
    resources :tickets, only: [:create]
  end
  resources :tickets , only: [:index, :show, :destroy, :new] do
    resources :bookings, only: [:create]
  end
end
