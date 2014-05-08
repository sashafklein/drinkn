describe Api::V1::DrinksController do

  include ControllerSpecHelper

  describe "drink_ingredients" do
    before do 
      skip_authentication
      @drink = FactoryGirl.create(:old_fashioned)
      @other_ingredient = FactoryGirl.create(:cherry)
    end

    it "pulls the associated drink ingredients" do
      get :drink_ingredients, id: @drink.id
      resp = JSON.parse(response.body)
      binding.pry
    end
  end
end