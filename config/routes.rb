Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :blogs
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
  # if Rails.env.production?
  #   get "#{Rails.root.to_s}/public/:file_path",
  #         to: redirect('/%{file_path}'),
  #         constraints: { file_path: %r{uploads/.*} }
  # end
end
