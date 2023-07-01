Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#anime
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  get 'animes' => 'animes#index'
  root 'hello#index' 


  #投稿ページ表示
  get 'animes/new' => 'animes#new'
  post 'animes' => 'animes#create'
  #詳細ページ
  get 'animes/:id' => 'animes#show',as:'anime'
  #編集
  patch 'animes/:id' => 'animes#update'

  #削除
  delete 'animes/:id' => 'animes#destroy'
  get 'animes/:id/edit' => 'animes#edit',as:'edit_anime'

  

  
  

  resources :animes do
      resources :likes, only: [:create, :destroy]
      resources :reactions, only: [:create]

  end
   
  
end
