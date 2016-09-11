Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'countries#index'

  resources :countries do
    resources :destinations, :except => [:index]
  end
end
