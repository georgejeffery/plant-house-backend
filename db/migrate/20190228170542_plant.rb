class Plant < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :flower_color, :string
    add_column :plants, :flower_time, :string
    add_column :plants, :wildlife_attractant, :string
  end
end
