class DrinksController < MainController
  
  before_action :load_drink, only: [:show, :edit, :update]

  def new
    @drink = Drink.new
  end

  def show
  end

  def index
  end

  def edit
  end

  def create
    @drink = Drink.new(drink_params)

    if @drink.save!
      flash[:success] = "Drink saved!"
      redirect_to @drink
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def load_drink
    @drink = Drink.find(params[:id])
  end

  def drink_params
    params.require(:drink).permit(:name, :description, :instructions)
  end

end