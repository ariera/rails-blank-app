module AppNotificationsHelper

  def errors_list(model)
    if model.errors.any?
      str= %{
        <div class="error-messages alert alert-danger">
          <h3>#{I18n.t('shared.errors', count:model.errors.count)}</h3>
          <ul>#{model.errors.full_messages.map{|msg| content_tag(:li, msg)}.join}</ul>
        </div>
      }.html_safe
    end
    str
  end

  def flash_type_to_bootstrap_class(type)
    case type.to_sym
      when :alert
        "alert-warning"
      when :error
        "alert-danger"
      when :notice
        "alert-success"
      else
        "alert-info"
    end
  end
end
