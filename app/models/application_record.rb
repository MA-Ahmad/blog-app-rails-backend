class ApplicationRecord < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  self.abstract_class = true

  def attach_image image_file
    self.image.attach(image_file)
    self.update(image_url: polymorphic_url(self.image))
  end
end
