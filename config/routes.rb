Rails.application.routes.draw do
  devise_for :users, path: :account, path_names: {sign_in: 'login', sign_out: 'logout'}

  root :to => 'countries#index'

  resources :users do
    resources :posts
  end
  resources :countries do
    resources :posts, :only => [:new, :create, :destroy]
    resources :destinations, :except => [:index]
  end
  resources :destinations, :only => [] do
    resources :posts, :only => [:new, :create, :destroy]
    resources :forecasts, :only => [:new, :create]
  end
end
