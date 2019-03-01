class RoomPlantSerializer < ActiveModel::Serializer
  attributes(*RoomPlant.attribute_names.map(&:to_sym))
end
