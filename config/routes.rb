Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/post'
  get 'admin/comments'
  get 'admin/users'
  get 'admin/show_post'
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
