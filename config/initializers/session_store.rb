if Rails.env == 'production'
    # Rails.application.config.session_store :cookie_store, key: "_blog_backend", domain: "https://blog-backend-rails.herokuapp.com"
    Rails.application.config.session_store :cookie_store, :key => '_blog_backend'
else
    Rails.application.config.session_store :cookie_store, key: "_blog_backend", domain: "localhost"
end


