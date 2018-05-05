Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :registrations, only: [:index, :new, :create]
  root to: 'registrations#new'
end
