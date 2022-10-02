Rails.application.routes.draw do
  resources :users
  resources :classnotes
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                      path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'classnotes#index'
end
