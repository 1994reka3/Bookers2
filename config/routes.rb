Rails.application.routes.draw do

  root 'home#top'
  get 'home/about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end

end
