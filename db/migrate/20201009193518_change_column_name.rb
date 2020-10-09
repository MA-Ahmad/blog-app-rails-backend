class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :blogs, :image_url, :image
    rename_column :users, :image_url, :image
  end
end
