Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :shows, only: [:index, :show]
  collection do
    get 'details'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
