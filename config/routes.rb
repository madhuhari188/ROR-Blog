Rails.application.routes.draw do
  get 'omniauth/github'
  root "welcome#index"
  # devise_for :users
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :tags
  # resources :posts
  # resources :topics
  # get "/topics/:id" => "topic::Posts#index"
  # ==> to show in the URL
  # get 'topics/:topic_id/posts' , to: 'posts#index', as: 'topic_posts'
  get '/posts' , to: 'posts#index'
  get '/post-topic' , to: 'posts#po'

  # get "/topics/:topic_id" => redirect("/topics/%{topic_id}/posts")
  # get "/posts/:id" => redirect("/topics/%{topic_id}/posts/%{id}")
  # match 'topics/:id' => 'posts#index', :as => 'topic_posts', :via => :get
  resources :topics  do
    resources :posts do
      post "/readstatus" , to: "posts#read_status"
      resources :comments
      resources :ratings
    end
  end
  # resources :posts ,only: [ :edit,:create, :new, :update, :destroy]



  #
  # get "/welcome", to: "welcome#index"
end
