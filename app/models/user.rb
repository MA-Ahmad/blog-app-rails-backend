class User < ApplicationRecord
    has_secure_password
    has_many :blogs, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_one_attached :image_file
    has_many :visits, class_name: "Ahoy::Visit"

    validates :email, presence: true, uniqueness: true
end
