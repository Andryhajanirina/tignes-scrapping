require 'sidekiq/web'

Rails.application.routes.draw do

  get 'subscriptions/destroy'

  get 'customers/show'

  devise_for :users
  resources :classifieds
  get '/search', to: 'classifieds#search'
  
  root 'classifieds#index'

  get 'stations/show'

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/legal', to: 'pages#legal'
  get '/pricing', to: 'pages#pricing'

  get '/dashboard', to:'users#dashboard'

  resources :subscriptions, only: [:destroy]

  # authenticate :user, lambda { |bu| bu.super_admin? } do
     mount Sidekiq::Web => '/sidekiq'
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
