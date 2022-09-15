Rails.application.routes.draw do
  root 'pages#home'
  resources :articles
  get 'imagen', to: 'pages#imagen'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'
  resources :users, except: [:new]
  #vista iniciar sesion
  get 'login', to: 'sessions#new'
  #validar inicio de sesion
  post 'login', to: 'sessions#create'
  #cerrar sesion
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
