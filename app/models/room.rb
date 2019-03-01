class Room < ApplicationRecord

  belongs_to :user
  has_many :room_plants
  has_many :plants, through: :room_plants
end
