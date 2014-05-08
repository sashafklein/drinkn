class DrinkIngredientSerializer < BaseSerializer
  attributes :id, :number, :measure, :name, :source_path

  def name
    object.name
  end

  def source_path
    ingredient_path(object.ingredient)
  end
end
