Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  resources :users, only: [:show, :edit, :update, :destroy]
  root "users#show"
  namespace :admin do
    root "users#index"
    resources :users, :documents
  end
end
