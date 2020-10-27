class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :reference_id
      t.string :reference_type
      t.references :user, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
