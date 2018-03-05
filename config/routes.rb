Rails.application.routes.draw do

  get 'events/index'

  devise_for :users

  root to: 'events#index'

  get 'dashboard', to: 'pages#dashboard'

  resources :events, only: [:show]
    resources :tickets do
      resources :bookings, only: [:create]
    end
end
