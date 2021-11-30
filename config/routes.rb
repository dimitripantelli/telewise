Rails.application.routes.draw do
  post 'progresses/create'
  get 'user/show'
  devise_for :users
  resources :users, only: :show do
    resources :followed_shows, only: [:index, :new, :create, :destroy]
  end
  get 'account', to: 'user#show'
  root to: 'pages#home'
  resources :shows, only: [:index, :show] do
    resources :season_summaries, only: [:index]
    resources :reviews, only: [:create]
  end
  delete 'reviews/:id', to: 'reviews#destroy', as: :review
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
