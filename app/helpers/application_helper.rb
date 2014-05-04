module ApplicationHelper

  def action_class
    "#{controller.params['action']}-action"
  end

  def controller_class
    "#{controller.params['controller'].split('/').first}-controller"
  end

  def auto_class
    [action_class, controller_class].join(' ')
  end
end
