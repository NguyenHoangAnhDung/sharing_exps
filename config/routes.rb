Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get "/home", to: "static_pages#home"
  resources :posts
  resources :users
  root "posts#index"
end
