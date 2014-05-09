SecretShareAjax::Application.routes.draw do
  get "friendships/create"
  resources :users, :only => [:create, :new, :show, :index] do
    resources :secrets, only: [:new]
    resources :friendships, only: [:create]
  end
  resources :secrets, only: [:create]
  resource :session, :only => [:create, :destroy, :new]

  root :to => "users#show"
end
