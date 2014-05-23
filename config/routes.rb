Popcorn::Application.routes.draw do
  root 'popcorn#index'
  
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  get "users", :to => 'users#index'
  get 'users/:id/movies', :to => 'users#movies'
  resources :movies
  resources :favorites
  match '*path' => 'popcorn#index', :via => [:get, :post]

end