Rails.application.routes.draw do
  # user関連のルーティング
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, except: [:index, :new, :create]
  get 'users/:id/confirm' => 'users#confirm', as: :confirm_user
  post 'users/:id/confirm' => 'users#unsubscribe', as: :unsubscribe_user
  resources :posts

  # admin関連のルーティング
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  get 'admins/top' => 'admins#top', as: :admin_top
  resources :admins
  post '/admins/:id' => 'admins#update_status', as: 'update_status_admin'
  get '/admins/:id/edit_password' => 'admins#edit_password', as: 'edit_password_admin'
  namespace :admin do
    resources :users, except: [:new, :create] # userの編集と削除
    resources :breweries # Breweryの登録・編集・削除
    resources :sakes # Sakeの登録・編集・削除
    resources :posts, only: [:index, :show, :destroy] # 投稿の編集と削除
  end

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: 'logout'
  end

  get '/about' => 'static_pages#about'
  root :to => 'static_pages#top'
end
