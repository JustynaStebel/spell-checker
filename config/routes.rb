Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  root "documents#index"
  resources :documents do
    resources :document_attachments do
        post :check_correctness, on: :member
    end
  end
  namespace :admin do
    root "users#index"
    resources :users, :documents
    resources :dictionaries, only: [:show]
  end
end
