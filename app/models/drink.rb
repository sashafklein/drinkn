class Drink < ActiveRecord::Base
  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients

  def add(ingredient, measure, number)
    drink_ingredients.where(ingredient_id: ingredient.id).first_or_create!(measure: measure, number: number)
  rescue
    false
  end

  def remove(ingredient)
    drink_ingredient = drink_ingredients.where(ingredient_id: ingredient.id).first
    drink_ingredient ? drink_ingredient.destroy : false
  end
end
