class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    
    has_many :blogs
    has_one_attached :image_file
    has_many :visits, class_name: "Ahoy::Visit"
    # mount_uploader :image, ImageUploader
end
