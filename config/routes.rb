Rails.application.routes.draw do
  post 'adds/create/:song_id' => 'adds#create', as: 'adds_create'

  get 'login' => 'sessions#new', as: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'
  post 'login' => 'sessions#create'

  root 'users#index'
  resources :users
  resources :songs

end
