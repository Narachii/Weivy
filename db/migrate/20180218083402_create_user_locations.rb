class CreateUserLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.datetime :expired_at

      t.timestamps
    end
  end
end
