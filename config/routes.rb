Rails.application.routes.draw do
  devise_for :users
  root to: 'venues#index'
  GET '/dashboard', to: 'pages#dashboard', as: :dashboard

  resources :venues, only: [:show, :create, :new, :edit, :update, :destroy] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:destroy, :update]
end
