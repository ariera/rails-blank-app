module ErrorMessagesHelper

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

end
