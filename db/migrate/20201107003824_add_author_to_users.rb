class AddAuthorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :author, :boolean, default: false
    add_column :users, :bio, :text
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
