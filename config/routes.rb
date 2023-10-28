Rails.application.routes.draw do
  authenticated :user, -> (user) { user.admin? } do 
    get 'admin', to: 'admin#index'
    get 'admin/posts'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_post/:custom_slug', to: "admin#show_post", as: "admin_post"
  end
  root "pages#home"
  get 'search', to: 'search#index'
  get "about", to: "pages#about"
  get "/user/:id", to: "users#profile", as: "user"


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :posts do
    resources :comments
  end
  resources :after_signup
end
