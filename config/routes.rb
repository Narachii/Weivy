Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "statics#index"

  resources :users do
    collection do
      get "weier"
    end
  end
  resources :weis do
    member do
      get "complete"
    end
  end
  resources :statics
  resources :user_locations

#   mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
