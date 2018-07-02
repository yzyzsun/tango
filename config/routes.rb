Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :books, only: [:index, :show]
end
