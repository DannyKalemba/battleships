Rails.application.routes.draw do
  root to: "games#index"
  resources :users, :except => [:index]
  resources :games, :except => [:edit, :update, :destroy]
  resources :sessions, only: [:new, :create]
  resources :shots, only: [:create, :index]
  resources :ships
  delete "/logout" => "sessions#destroy"

end
