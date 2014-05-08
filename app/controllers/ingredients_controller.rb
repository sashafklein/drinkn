class IngredientsController < MainController
  
  before_action :load_ingredient, only: [:show, :edit, :update]

  def new
  end

  def show
  end

  def index
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def load_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end