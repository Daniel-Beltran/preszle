Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :articles, only: %i[index show] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :lists, only: %i[index new create show destroy]
  resources :user_interests, only: %i[new create index]
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/my_interests', to: 'user_interests#index', as: 'my_interests'
  post 'my_interests', to: 'user_interests#update', as: 'my_interests_update'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
