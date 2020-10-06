class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :authorName
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
