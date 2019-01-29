Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static_pages#index"

  get "about", to: "static_pages#about"
  get "contact-us", to: "static_pages#contact"
  get "contact/:id", to: "contacts#show"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :contacts
  resources :users, only: [:new, :create, :show]
end
