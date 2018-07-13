Rails.application.routes.draw do
  get 'admins/show'

  get 'users/show'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  resources :posts

  get '/about' => 'static_pages#about'
  root :to => 'static_pages#top'
end
