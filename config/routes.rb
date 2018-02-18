Rails.application.routes.draw do
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "weis#index"

  resources :users
  resources :weis
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
