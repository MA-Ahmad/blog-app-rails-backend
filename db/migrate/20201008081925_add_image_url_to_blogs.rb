class AddImageUrlToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :image_url, :string
  end
end
