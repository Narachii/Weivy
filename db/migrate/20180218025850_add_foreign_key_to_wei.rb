class AddForeignKeyToWei < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :weis, :users, column: :sender
  end
end
