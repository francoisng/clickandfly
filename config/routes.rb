Rails.application.routes.draw do
  devise_for :users
  resources :bookings, only: [:destroy, :update, :edit]
  resources :airplanes do
    resources :bookings, only: [:create]
  end
  get "dashboard", to: "pages#dashboard"
    root to: 'pages#home'
end
