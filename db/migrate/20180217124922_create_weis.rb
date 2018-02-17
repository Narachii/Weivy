class CreateWeis < ActiveRecord::Migration[5.0]
  def change
    create_table :weis do |t|
      t.integer :receiver
      t.integer :sender
      t.boolean :wei

      t.timestamps
    end
  end
end
