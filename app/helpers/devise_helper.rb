module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human)

    html = <<-HTML
    
    <div class="alert alert-danger" role="alert">
      <div class="h4">#{sentence}</div>
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end
end

