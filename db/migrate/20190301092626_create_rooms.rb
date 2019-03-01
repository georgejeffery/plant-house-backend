class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|

      t.timestamps
      t.string :name
      t.integer :user_id
    end
  end
end
