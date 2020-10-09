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
  # get '*all', to: 'application#mount', constraints: lambda { |req|
  #   req.path.exclude? 'rails/active_storage'
  # }
  scope format: true, constraints: { format: /jpg|png|gif|PNG/ } do
    get '/*anything', to: proc { [404, {}, ['']] }, constraints: lambda { |request| !request.path_parameters[:anything].start_with?('rails/') }
  end
end
