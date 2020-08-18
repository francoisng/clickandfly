Rails.application.routes.draw do
  devise_for :users
  resources :airplanes do
  resources :bookings, only: [:create]
  end
  root to: 'pages#home'
end
