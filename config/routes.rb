Rails.application.routes.draw do
  root "pages#home"

  get 'search', to: 'search#index'
  get 'users/profile'
  get "about", to: "pages#about"
  get "/user/:id", to: "users#profile", as: "user"


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :posts do
    resources :comments
  end
end
