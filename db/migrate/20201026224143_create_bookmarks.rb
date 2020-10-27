class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :reference_id
      t.string :reference_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
