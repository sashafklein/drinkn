class DrinkIngredientSerializer < BaseSerializer
  attributes :id, :number, :measure, :name, :source_path, :ingredient

  def name
    object.name
  end

  def source_path
    ingredient_path(object.ingredient)
  end

  def ingredient
    IngredientSerializer.new(object.ingredient)
  end
end
