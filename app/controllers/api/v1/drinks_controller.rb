class Api::V1::DrinksController < ApiController

  def drink_ingredients
    @drink = Drink.find(params[:id])
    error(404, "No drink found!") unless @drink
    render json: @drink.drink_ingredients, each_serializer: DrinkIngredientSerializer
  end

  def index
    render json: Drink.all, each_serializer: DrinkSerializer
  end

end