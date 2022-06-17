# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  devise_scope :user do
    # Redirectrs signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles

  get '/pages/about', to: 'pages#about'
end
