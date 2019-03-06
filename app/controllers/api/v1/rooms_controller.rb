class Api::V1::RoomsController < API::V1::BaseController


  def show
      room = Room.find(params[:id])
    #plants = room.plants

      render json: room, serializer: RoomSerializer
    #render json: plants, serializer: PlantSerialize
      #render json: {error: "Not a valid user."}, status: 401
  
end

  def index
    rooms  = Room.all

    render json: rooms, each_serializer: RoomSerializer
  end

  def new

  end

  def create

    @user = User.find(params[:user_id])
    @room = Room.new(room_params)
    @room.user = @user
    plants = params[:plants]
    plants.each do |plant|
      plant = Plant.find(plant["id"])
      @room.plants.push(plant)
    end
    #@room.plants.push(plant_params)
    if @room.save
      render json: @room, status: :created, serializer: RoomSerializer
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    if @room.update(room_params)
      render json: @room, status: :ok, serializer: RoomSerializer
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
  end

  private
  
  def room_params
    params.permit(:name, :humidity, :temperature, :light, :flowers, :plants)
  end

  # def plant_params
  #   params.permit(:plants)
  # end
end
