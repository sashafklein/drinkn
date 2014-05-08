class Api::V1::IngredientsController < ApiController

  def index
    render json: Ingredient.all, each_serializer: IngredientSerializer
  end

end