Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
	
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'  

  resources :sections, :path => "forum"
  resources :topics
  resources :users
  resources :articles
  resources :posts, except: [:show, :index]
  resources :class_lookups, except: [:show]
  resources :roles, except: [:show]


  root 'articles#index'
end
