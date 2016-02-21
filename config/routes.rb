Rails.application.routes.draw do
  devise_for :users
  root to: "homes#show"
  resources :notes, only: [:index, :new, :create, :show, :update]
end
