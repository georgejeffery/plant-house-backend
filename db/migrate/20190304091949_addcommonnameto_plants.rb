class AddcommonnametoPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :commonname, :string
  end
end
