Rails.application.routes.draw do
  post '/:username/follow_user', to: 'relationships#follow_user', as: :follow_user
  post '/:username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  devise_for :user, controllers: {
    # confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # unlocks: 'users/unlocks',
  }, skip: [:sessions]

  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    get 'register' => 'users/registrations#new'
  end

  root to: "photos#index"

  resources :photos do
    member do
      get "/likes" => "liking#likes", as: :likes
      post "/like" => "liking#like", as: :like
      post "/unlike" => "liking#unlike", as: :unlike
    end
    resources :comments
    resources :likes
    resources :unlikes
  end

  resources :users, param: :username, only: :show do
    member do
      get :followers 
      get :following 

    end
    resources :follow
    resources :unfollow
  end
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
