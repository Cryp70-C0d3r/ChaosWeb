Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  # Set Project Root Directory #
  root 'static_pages#home'

  # Set Project Static Page Directories #
  get 'about',          to: 'static_pages#about'
  get 'contact',        to: 'static_pages#contact'
  get 'services',       to: 'static_pages#services'
  get 'portfolio',      to: 'static_pages#portfolio'
  get 'success',        to: 'static_pages#order_success'
  get 'cancel',         to: 'static_pages#order_cancel'

  # Set Users Directories #
  get 'signup',         to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  # Set Project Resources #
  resources :contact, only: [:index, :new, :create]
  resources :users
end
