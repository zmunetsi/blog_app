Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#home'

  get '/about'=> 'pages#about'

  get '/contact'=> 'pages#contact'
  get '/users/dashboard'=> 'users#dashboard'
  resources :posts
  resources :posts do
    resources :comments
  end
  resources :categories

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
