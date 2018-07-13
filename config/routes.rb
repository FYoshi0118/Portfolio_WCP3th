Rails.application.routes.draw do
  # user関連のルーティング
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, except: [:index, :new, :create]
  resources :posts

  # admin関連のルーティング
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  get 'admins/index' => 'admins#index', as: :admins
  resources :admins, except: [:index, :new, :create]
  namespace :admins do
    resources :users, except: [:new, :create] # userの編集と削除
    resources :breweries # Breweryの登録・編集・削除
    resources :sakes # Sakeの登録・編集・削除
    resources :posts, only: [:index, :show, :destroy] # 投稿の編集と削除
  end

  get '/about' => 'static_pages#about'
  root :to => 'static_pages#top'
end
