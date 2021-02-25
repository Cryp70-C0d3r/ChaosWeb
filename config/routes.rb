Rails.application.routes.draw do

  # Set Project Root Directory #
  root 'static_pages#home'

  # Set Project Static Page Directories #
  get '/about',          to: 'static_pages#about'
  get '/contact',        to: 'static_pages#contact'
  get '/services',       to: 'static_pages#services'
  get '/portfolio',      to: 'static_pages#portfolio'

  # Set Project Resources #
  resources :contact, only: [:index, :new, :create]
end
