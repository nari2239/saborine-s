Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records, only: [:index, :create, :edit , :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
