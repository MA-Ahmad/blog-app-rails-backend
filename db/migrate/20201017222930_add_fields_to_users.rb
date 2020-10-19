class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :summary, :text
    add_column :users, :location, :string
    add_column :users, :education, :string
    add_column :users, :skills, :text
    add_column :users, :emp_name, :string
    add_column :users, :emp_title, :string
  end
end
