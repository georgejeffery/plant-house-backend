class Api::V1::RoomsController < API::V1::BaseController
  def show
    room = Room.find(params[:id])
    #plants = room.plants

    render json: room, serializer: RoomSerializer
    #render json: plants, serializer: PlantSerializer
  end

  def index
    rooms  = Room.all

    render json: rooms, each_serializer: RoomSerializer
  end
end
