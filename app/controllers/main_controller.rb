class MainController < ApplicationController
  protect_from_forgery with: :exception

  after_action :merge_current_user_and_current_visit!

  private

  def merge_current_user_and_current_visit!
    if current_user && !current_visit.user
      current_visit.user = current_user
      current_visit.save!
    end
  end
end