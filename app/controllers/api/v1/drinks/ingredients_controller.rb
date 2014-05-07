class Drink::IngredientsController < ApiController

  def index
    @ingredients = @drink.ingredients
    render json: @ingredients, each_serializer: IngredientSerializer
  end

  private

  def load_drink
    @drink = Drink.find(params[:drink_id])
  end

end