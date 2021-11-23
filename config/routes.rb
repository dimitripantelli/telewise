Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  resources :users, only: :show
  get 'account', to: 'user#show'
  root to: 'pages#home'
  resources :shows
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
