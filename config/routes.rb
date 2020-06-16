Rails.application.routes.draw do
  devise_for :users
  root to: 'videos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :videos, only: [:index, :show, :new, :create] do
    collection do
      get :dashboard
    end
  end
  resources :interactions, only: [:create, :update]

  resources :playlists  do
    resources :playlist_videos, only: :create
  end
  resources :playlist_videos, only: :destroy

end
