class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :reference, dependent: :destroy
  has_many :bookmarks, as: :reference, inverse_of: :reference, dependent: :destroy 
  has_one_attached :image_file
end
