class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :email, unique: true #adding the index itself doesn't force uniqueness at the db level, but unique:true does
  end
end
