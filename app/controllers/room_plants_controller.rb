class RoomPlantsController < ApplicationController
  before_action :set_room_plant, only: [:show, :update, :destroy]

  # GET /room_plants
  # GET /room_plants.json
  def index
    @room_plants = RoomPlant.all
  end

  # GET /room_plants/1
  # GET /room_plants/1.json
  def show
  end

  # POST /room_plants
  # POST /room_plants.json
  def create
    @room_plant = RoomPlant.new(room_plant_params)

    if @room_plant.save
      render :show, status: :created, location: @room_plant
    else
      render json: @room_plant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /room_plants/1
  # PATCH/PUT /room_plants/1.json
  def update
    if @room_plant.update(room_plant_params)
      render :show, status: :ok, location: @room_plant
    else
      render json: @room_plant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /room_plants/1
  # DELETE /room_plants/1.json
  def destroy
    @room_plant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_plant
      @room_plant = RoomPlant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_plant_params
      params.fetch(:room_plant, {})
    end
end
