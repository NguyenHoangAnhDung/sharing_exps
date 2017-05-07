Rails.application.routes.draw do
  get "/home", to: "static_pages#home"
  resources :posts
  resources :users
  root "posts#index"
end
