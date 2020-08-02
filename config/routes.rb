Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show]

end
