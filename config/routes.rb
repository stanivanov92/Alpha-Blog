# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'contacts', to: 'pages#contacts'
  get 'signup', to: 'users#new'
  resources :users, except: %i[new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  resources :categories, except: %i[destroy]
end
