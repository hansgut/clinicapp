Rails.application.routes.draw do
  get 'chatrooms/index'

  get 'homes/index'

  get 'doctors/show'

  devise_for :doctors, controllers: {
        sessions: 'doctors/sessions'
      }

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :diseases
  resources :chatrooms
  root 'diseases#index'
  resources :users, only: [:show]
  resources :doctors, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
