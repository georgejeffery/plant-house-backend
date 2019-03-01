class Api::V1::PlantsController < API::V1::BaseController
  def show
    plant = Plant.find(params[:id])

    render json: plant, serializer: PlantSerializer
  end

  def index
    plants  = Plant.all

    render json: plants, each_serializer: PlantSerializer
  end
end
