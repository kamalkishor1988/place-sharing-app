Rails.application.routes.draw do
  get 'users/index'

  # get 'places/index'

  # get 'places/new'

  # get 'places/create'

  # get 'places/show'

  devise_for :users
  resources :users, only: [:index]
  resources :places, except: [:update, :edit, :destroy]
  root 'users#index'
  get '/:username', to: 'places#public_share', constraints: { username: /[^\/]+/} , as: 'index'
end
