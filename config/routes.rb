Rails.application.routes.draw do
  resources :sessions
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :events do
    resources :subscriptions
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
end
