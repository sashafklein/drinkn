class Api::V1::DrinksController < ApiController

  before_action :load_drink, only: [:drink_ingredients, :add, :remove]
  before_action :load_ingredient, only: [:add, :remove]

  def drink_ingredients
    error(404, "No drink found!") unless @drink
    render_drink_ingredients
  end

  def index
    render json: Drink.all, each_serializer: DrinkSerializer
  end

  def add
    error(404, "No drink found!") unless @drink

    if @drink.add(@ingredient, params[:measure], params[:number])
      render_drink_ingredients
    else
      error(500, "Something went wrong. Remember to include a measure and number.")
    end
  end

  def remove
    error(404, "No drink found!") unless @drink

    if @drink.remove(@ingredient)
      render_drink_ingredients
    else
      error(500, "Something went wrong.")
    end
  end

  private

  def load_drink
    @drink = Drink.find(params[:id])
  end

  def load_ingredient
    @ingredient = Ingredient.find(params[:ingredient_id])
  end

  def render_drink_ingredients
    render json: @drink.drink_ingredients, each_serializer: DrinkIngredientSerializer
  end
end