class UserSerializer < ActiveModel::Serializer
  attributes(*User.attribute_names.map(&:to_sym))

  has_many :rooms, serializer: RoomSerializer
end
