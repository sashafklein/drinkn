class UsersController < MainController
  
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created successfully."
    else
      flash[:error] = "User creation failed."
    end

    redirect_to @user
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Changes saved."
    else
      flash[:error] = "Changes failed."
    end
    
    redirect_to @user
  end

  def destroy
    if @user.destroy
      flash[:success] = "User deleted."
    else
      flash[:error] = "User deletion failed"
    end
    
    redirect_to root_path
  end

  private

  def load_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end