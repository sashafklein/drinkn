class DrinkIngredient < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ingredient

  delegate :name, to: :ingredient

  validates :measure, :number, :ingredient_id, presence: true
  
  def source
    ingredient
  end

  def serialize
    DrinkIngredientSerializer.new self
  end

end
