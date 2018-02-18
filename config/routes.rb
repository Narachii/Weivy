Rails.application.routes.draw do
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "statics#index"

  resources :users
  resources :weis do
    member do
      get "complete"
    end
  end
  resources :statics
  resources :user_locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
