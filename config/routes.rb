Rails.application.routes.draw do
  get 'blogs/index'
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  resources :blogs
end
