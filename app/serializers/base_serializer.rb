class BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  def asset_path(path)
    ActionController::Base.helpers.asset_path(path)
  end
end