Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :blogs
      resources :likes, only: %i[create destroy]
      resources :bookmarks, only: %i[create destroy]
      resources :sessions, only: %i[create] do
        collection do
          delete :logout, to: 'sessions#logout'
          get :logged_in, to: 'sessions#logged_in'
        end
      end
      resources :registrations, only: %i[create]
      resources :users, only: %i[update]
    end
  end

  root 'home#index'
  # get '*path', to: 'pages#index', via: :all
end
