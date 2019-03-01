class RoomSerializer < ActiveModel::Serializer
  attributes(*Room.attribute_names.map(&:to_sym))

  has_many :plants, serializer: PlantSerializer
end
