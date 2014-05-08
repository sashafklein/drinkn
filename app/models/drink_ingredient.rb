class DrinkIngredient < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ingredient

  delegate :name, to: :ingredient

  def source
    ingredient
  end

end
