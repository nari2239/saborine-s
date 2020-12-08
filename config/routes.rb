Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records, only: :index
  resources :users, only: :show
end
