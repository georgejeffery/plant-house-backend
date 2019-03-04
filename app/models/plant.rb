class Plant < ApplicationRecord

  has_many :room_plants
  has_many :rooms, through: :room_plants

  def humidity
    if self[:resistances] == "Humidity tolerant" then
      return "high"
    elsif self[:resistances] == "Drought tolerant" then
      return "low"
    end
  end

  def self.flowers
   where("flowers is not null")
  end

  def self.humid_proof
    where(resistances: 'Humidity tolerant')
  end

  def self.drought_proof
    where(resistances: 'Drought tolerant')
  end

  def self.light(light)
    if light == "bright"
      where('sun_requirements LIKE "%Full Sun%"')
    elsif light == "medium"
      where('sun_requirements LIKE "%Partial%"')
    elsif light == "low"
      where('sun_requirements LIKE "%Full Shade%"')
    end
  end



end
