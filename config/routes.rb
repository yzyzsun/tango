Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  resources :books, only: [:index, :show] do
    resources :words, only: [:new, :create, :show, :destroy]
  end
  post "/records/:id", to: "records#record", as: "record"
  get "/books/:id/learn", to: "records#learn", as: "learn"
  get "/books/:id/review", to: "records#review", as: "review"
  delete "/books/:id/giveup", to: "records#giveup", as: "giveup"
end
