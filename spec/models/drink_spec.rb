require 'spec_helper'

describe Drink do

  describe 'ingredient manipulation' do
    before do 
      @ingredient = FactoryGirl.create(:ingredient)
      @drink = FactoryGirl.create(:drink)
      @drink.add(@ingredient, 'oz', 2.5)
    end

    describe "add" do
      it "adds an ingredient in the given quantities" do
        @drink.ingredients.should == [@ingredient]
        
        di = @drink.drink_ingredients.first
        
        di.ingredient.should == @ingredient
        di.measure.should == 'oz'
        di.number.should == 2.5
      end
    end

    describe "remove" do 
      it "takes out the drink ingredient and leaves the ingredient" do
        expect{ @drink.remove(@ingredient) }
          .to change{ DrinkIngredient.count }.by -1
        @ingredient.reload.should be
      end
    end
  end
end
