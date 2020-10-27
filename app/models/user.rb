class User < ApplicationRecord
    has_secure_password
    has_many :blogs, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_one_attached :image_file
    has_many :visits, class_name: "Ahoy::Visit"

    validates :email, with: URI::MailTo::EMAIL_REGEXP, 
            presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }
end
