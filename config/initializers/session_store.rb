if Rails.env == 'production'
    Rails.application.config.session_store :cookie_store, key: "_blog_backend", domain: "blog-backend-rails.herokuapp.com"
else
    Rails.application.config.session_store :cookie_store, key: "_blog_backend", domain: "localhost"
end