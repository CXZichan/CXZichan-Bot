Rails.application.routes.draw do
  root "discord_channels#index"

  resources :discord_channels
  resources :roles
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
