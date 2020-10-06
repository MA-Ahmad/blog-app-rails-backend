Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/blogs', to: 'blogs#index'
      get '/blogs/:id', to: 'blogs#show'
      get '/blogs/new', to: 'blogs#new'
      post 'blogs/create', to: 'blogs#create'
      get '/blogs/edit/:id', to: 'blogs#edit'
      put '/blogs/update/:id', to: 'blogs#update'
      delete '/blogs/destroy/:id', to: 'blogs#destroy'

      resources :sessions, only: %i[create] do
        collection do
          delete :logout, to: 'sessions#logout'
          get :logged_in, to: 'sessions#logged_in'
        end
      end
      resources :registrations, only: %i[create]
    end
  end

  root 'home#index'
  get '*path', to: 'pages#index', via: :all
end
