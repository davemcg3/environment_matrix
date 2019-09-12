Rails.application.routes.draw do
  resources :enterprises
  resources :services
  resources :environments
  resources :projects
  resources :users
  get :matrix, action: :index, controller: :matrix

  root 'matrix#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
