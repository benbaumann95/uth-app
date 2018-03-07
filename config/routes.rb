Rails.application.routes.draw do
  devise_for :users

  root to: 'events#index'

  get 'dashboard', to: 'pages#dashboard'
  get 'about', to: 'pages#about'
  get 'ticket_file', to: 'pages#ticket_file'
  get 'profile', to: 'pages#profile'

  resources :events, only: [:index, :show, :create, :new]
    resources :tickets , only: [:index, :show, :create, :destroy] do
      resources :bookings, only: [:create]
    end
end
