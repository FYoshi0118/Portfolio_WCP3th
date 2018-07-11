Rails.application.routes.draw do
  resources :posts

  get '/about' => 'static_pages#about'
  root :to => 'static_pages#top'
end
