Rails.application.routes.draw do
  devise_for :users
  resources :airplanes
  root to: 'pages#home'
end
