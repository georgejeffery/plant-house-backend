class PlantSerializer < ActiveModel::Serializer 
  attributes(*Plant.attribute_names.map(&:to_sym))
end