Rails.application.routes.draw do
  resources :registrations, only: [:index, :new, :create]
  root to: 'registrations#new'
end
