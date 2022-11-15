Rails.application.routes.draw do
  resources :favorites
  resources :courses
  resources :users
  resources :classnotes do
    resources :reviews
  end
  resources :reviews
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                      path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'favorites#index'
end
