class AddIndicesAndConstrintsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :password_digest, :string, null: false
    change_column :users, :session_token, :string, null: false

    add_index :users, :session_token, unique: true
  end

end
