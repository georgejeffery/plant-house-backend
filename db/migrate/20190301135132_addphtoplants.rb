class Addphtoplants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :soil_ph_preferences, :string
    add_column :plants, :fruit, :string
  end
end
