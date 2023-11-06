Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  resources :songs do
    resources :likes, only: [:create, :destroy]
  end
  root 'songs#index'

  patch 'songs/:id' => 'songs#update'

  delete 'songs/:id' => 'songs#destroy'

  resources :shindans

  resources :lists
end
