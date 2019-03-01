class Plant < ApplicationRecord

  has_many :room_plants
  has_many :rooms, through: :room_plants
end
