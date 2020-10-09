class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    
    has_many :blogs
    # has_one_attached :image_file
    mount_uploader :image, ImageUploader
end
