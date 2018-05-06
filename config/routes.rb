Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :registrations, only: [:index, :new, :create]
  resource :thanks, only: [:show]
  root to: 'registrations#new'
end
