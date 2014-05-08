module ControllerSpecHelper
  def skip_authentication
    ApiController.any_instance.stub :ensure_member!
    MainController.any_instance.stub :merge_current_user_and_current_visit!
    if @controller
      @controller.stub(:ensure_member!)
      @controller.stub(:merge_current_user_and_current_visit!)
    end
  end
end