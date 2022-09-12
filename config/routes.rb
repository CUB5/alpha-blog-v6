Rails.application.routes.draw do
  root 'pages#home'
  resources :articles
  get 'imagen', to: 'pages#imagen'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
