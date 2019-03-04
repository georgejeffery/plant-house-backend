class Enhancerooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :light, :string
    add_column :rooms, :temperature, :integer
    add_column :rooms, :humidity, :string
    add_column :rooms, :flowers, :boolean
  end
end
