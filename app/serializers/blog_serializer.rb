class BlogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :authorName, :content, :user_id

  attribute :user do |object|
    object&.user&.name
  end
end
