class AddColumnsToBlog < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :content_text, :text
    add_column :blogs, :content_html, :text
  end
end
