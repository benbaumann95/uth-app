Rails.application.routes.draw do

  get 'events/index'

  devise_for :users

  root to: 'events#index'

  get 'dashboard', to: 'pages#dashboard'
  get 'about', to: 'pages#about'
  get 'ticket_file', to: 'pages#ticket_file'

  resources :events, only: [:index, :show, :create, :new]
    resources :tickets do
      resources :bookings, only: [:create]
    end
end
