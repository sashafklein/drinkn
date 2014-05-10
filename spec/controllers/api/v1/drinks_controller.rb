describe Api::V1::DrinksController do

  include ControllerSpecHelper

  before { skip_authentication }

  describe "drink_ingredients" do
    before do 
      @drink = FactoryGirl.create(:old_fashioned)
      @other_ingredient = FactoryGirl.create(:cherry)
    end

    it "pulls the associated drink ingredients" do
      get :drink_ingredients, id: @drink.id
      resp = JSON.parse(response.body)
      binding.pry
    end
  end

  describe "addition/removal" do
    
    before do  
      @drink = FactoryGirl.create(:drink)
      @ingredient = FactoryGirl.create(:bourbon)
    end

    describe "add" do 
      it "adds a drink ingredient if given number and measure" do
        @drink.drink_ingredients.first.should be_nil

        post :add, { ingredient_id: @ingredient.id, measure: 'oz', number: '3.5' }
        
        di = @drink.drink_ingredients.first
        di.name.should == "Bourbon"
        di.measure.should == 'oz'
        di.number.should == 3.5
      end

      it "errors without measure and number" do
        post :add, { ingredient_id: @ingredient.id }
        
        JSON.parse(response.body)['response_type'].should == "ERROR"
        JSON.parse(response.body)['message'].should == 'Something went wrong. Remember to include a measure and number.'
      end 

      it "doesn't add the ingredient if it's already there" do
        @drink.add(@ingredient, 'measure', 2)
        post :add, { ingredient_id: @ingredient.id, measure: 'oz', number: '3.5' }
        
        JSON.parse(response.body)['response_type'].should == "ERROR"
        @drink.drink_ingredients.count.should == 1
      end
    end

    describe "remove" do
      it "removes the drink ingredient by ingredient" do
        @drink.add(@ingredient, 'measure', 2)
        post :remove, { ingredient_id: @ingredient.id }

        @drink.drink_ingredients.should be_empty
      end
    end
  end
end