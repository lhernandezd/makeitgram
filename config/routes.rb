Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  get 'posts', to: 'posts#index' #to: 'controlador#metodo'
  get 'posts/new'
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#show', as: 'posts_show'
  post 'posts/:id/comments', to:'comments#create', as: 'comments'

  get 'users/:username', to: 'users#profile', as: 'users_profile' #controlador vista
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
