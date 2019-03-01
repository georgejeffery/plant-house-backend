class CreateRoomPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :room_plants do |t|

      t.timestamps
      t.integer :room_id
      t.integer :plant_id
    end
  end
end
