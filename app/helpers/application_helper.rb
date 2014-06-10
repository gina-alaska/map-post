module ApplicationHelper
  def bootstrap_alert_class(type)
    case type.to_s
    when 'notice'
      'info'
    else
      type
    end
  end
end
