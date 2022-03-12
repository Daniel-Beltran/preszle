Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :articles, only: %i[index show update] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookmarks, only: :destroy
  resources :lists, only: %i[index show destroy new create edit update]
  resources :user_interests, only: %i[new create index]
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/my_interests', to: 'user_interests#index', as: 'my_interests'
  post '/my_interests', to: 'user_interests#update', as: 'my_interests_update'
  post '/readtime', to: 'pages#readtime', as: 'readtime'
  get '/edit', to: 'articles#edit_card', as: 'edit_card'
end
