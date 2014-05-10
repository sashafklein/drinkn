require 'spec_helper'
describe Api::V1::IngredientsController do 
  describe 'index' do 

    include ControllerSpecHelper
    
    before do 
      @drink = FactoryGirl.create(:manhattan)
      skip_authentication
    end

    it "returns the serialized list of ingredients associated with the drink" do
      get :index
      resp = JSON.parse(response.body)

      resp['ingredients'].map{ |i| i['name'] }.sort.should == ['Angostura Bitters', 'Bourbon', 'Orange Peel', 'Vermouth']
    end
  end
end