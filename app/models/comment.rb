class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  has_many :likes, as: :reference, dependent: :destroy 
end
