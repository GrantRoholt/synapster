class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true  # Rails method called "add_index" to add an index
  end
end
