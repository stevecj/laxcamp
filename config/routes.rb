Rails.application.routes.draw do

  root to: 'home#show', as: :home

  resource :session, only: [:create, :destroy]

  resources :signups, only: [:create]

  # Just one venue for now.
  resource :venue, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
