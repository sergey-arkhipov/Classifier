Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :catalogs, only: %i[index create edit update destroy]
  # Defines the root path route ("/")
  root 'catalogs#index'
end
