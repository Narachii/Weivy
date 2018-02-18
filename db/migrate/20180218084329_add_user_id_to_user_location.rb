class AddUserIdToUserLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :user_locations, :user_id, :integer, null: false, after: :id
  end
end
