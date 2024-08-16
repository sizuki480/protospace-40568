Rails.application.routes.draw do

  #device設定
  devise_for :users

  # get 'prototypes/index'

  #TOPページ設定
  root to: "prototypes#index"

  #prototypesルーティング設定
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    #commentsルーティング設定
    resources :comments, only: :create
  end
  resources :users, only: :show
end