Rails.application.routes.draw do
  devise_for :users, path: :user_accounts, path_names: {sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'countries#index'

  resources :users do
    resources :posts
  end
  resources :countries do
    resources :posts
    resources :destinations, :except => [:index] do
      resources :posts
    end
  end
end
