Rails.application.routes.draw do
  get 'users/profile'
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  resources :posts do
    resources :comments
  end
  get "/user/:id", to: "users#profile", as: "user"
  # get 'pages/home'
  # get 'pages/about'
  # get "home", to: "pages#home"

  get "about", to: "pages#about"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
