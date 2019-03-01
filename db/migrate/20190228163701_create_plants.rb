class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|

      t.timestamps
      t.string :latin_name
      t.string :plant_habit
      t.string :life_cycle
      t.string :sun_requirements
      t.string :water_preferences
      t.string :minimum_cold_hardiness
      t.string :maximum_recommended_zone
      t.string :plant_height
      t.string :plant_spread
      t.string :leaves
      t.string :flowers
      t.string :bloom_size
      t.string :underground_structures
      t.string :suitable_locations
      t.string :resistances
      t.string :propagation
      t.string :containers
    end
  end
end
