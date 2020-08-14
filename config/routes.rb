Rails.application.routes.draw do
  # ログインページのルーティング
  get "login" => "users#login_form"
  # ログインページのデータを送信するためのルーティング
  post "login" => "users#login"
  # ログアウトのルーティング
  post "logout" => "users#logout"

  # ユーザー編集ページのデータを送信するためのルーティング
  post "users/:id/update" => "users#update"
  # ユーザー編集ページのルーティング
  get "users/:id/edit" => "users#edit"
  # ユーザー登録ページのデータを送信するためのルーティング
  post "users/create" => "users#create"
  # ユーザー登録ページのルーティング
  get "signup" => "users#new"
  # ユーザー一覧ページのルーティング
  get "users/index" => "users#index"
  # ユーザー詳細ページのルーティング
  get "users/:id" => "users#show" 

  # 投稿検索ページのルーティング
  get "posts/search" => "posts#search"

  # 投稿一覧ページのルーティング
  get "posts/index" => "posts#index"
  # 新規投稿ページのルーティング
  get "posts/new" => "posts#new"
  # 投稿詳細ページのルーティング
  get "posts/:id" => "posts#show"
  # 新規投稿ページのデータを送信するためのルーティング
  post "posts/create" => "posts#create"
  # 投稿編集ページへのルーティング
  get "posts/:id/edit" => "posts#edit"
  # 投稿編集ページのデータを送信するためのルーティング
  post "posts/:id/update" => "posts#update"
  # 投稿削除のルーティング
  post "posts/:id/destroy" => "posts#destroy"
  
  # トップページへのルーティング
  get "/" => "home#top"
  # アバウトページへのルーティング
  get "about" => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
