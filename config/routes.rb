Rails.application.routes.draw do
  get 'users/new'

  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
end
