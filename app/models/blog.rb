class Blog < ApplicationRecord
  belongs_to :user
  # has_one_attached :image_file

  mount_uploader :image, ImageUploader
end
