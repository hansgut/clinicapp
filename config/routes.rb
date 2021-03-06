Rails.application.routes.draw do

  get 'treatments/index'

  get 'treatments/new'

  get 'treatments/edit'

  get 'treatments/show'

  devise_for :doctors, controllers: {
        sessions: 'doctors/sessions'
      }

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :treatments
  resources :diseases
  resources :chatrooms do
    resources :messages
  end
  root 'homes#index'
  resources :lists do
    resources :heals
  end
  resources :users, only: [:show]
  resources :doctors, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
