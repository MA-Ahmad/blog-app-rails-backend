class ApplicationRecord < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  # after_create :save_image_url
  self.abstract_class = true

  def attach_image image_file
    self.image_file.attach(image_file)
    # self.update(image: url_for(self.image_file))
    self.update(image: Rails.application.routes.url_helpers.rails_blob_path(self.image_file, only_path: true))
  end

  # def save_image_url
  #   if self.is_a?(Blog)
  #     debugger
  #     self.update(image: polymorphic_url(self.image_file))
  #   end
  # end
end
