class Api::V1::PlantsController < API::V1::BaseController

  def show
    plant = Plant.find(params[:id])
    render json: plant, serializer: PlantSerializer
  end

  def index
    plants  = Plant.all

    render json: plants, each_serializer: PlantSerializer
  end  

  def search
    #term = params[:humidity] || params[:light] || params[:temperature] || params[:flowers] || nil
    term = params
    plants = []
    if term[:humidity] == "high" 
      if term[:flowers] == "true"
        plants = Plant.flowers & Plant.humid_proof & Plant.light(term[:light])
      else
        plants = (Plant.humid_proof & Plant.light(term[:light])) - Plant.flowers
      end
    else 
      if term[:flowers] == "true"
        plants = Plant.flowers & Plant.drought_proof & Plant.light(term[:light])
      else
        plants = (Plant.drought_proof & Plant.light(term[:light])) - Plant.flowers
      end
    end
    #plants = Plant.where('latin_name LIKE ?', "%#{term}%") if term
    render json: plants, each_serializer: PlantSerializer
  end

  private

  def true?(obj)
    obj.to_s == "true"
  end
end
