Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  get 'home/about' => 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "devise/sessions#new"
  root "homes#top"
  resources :users, only: [:index, :create, :show, :edit, :update]
  resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
