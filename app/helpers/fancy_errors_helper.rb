module FancyErrorsHelper
  def error_messages_for(*params)
    options = params.extract_options!.symbolize_keys
    options.reverse_merge!(
      :header_message => 'Uh oh!',
      :message => "We had trouble with your submission:",
      :class => 'error',
      :id => nil
    )

    if object = options.delete(:object)
      objects = [object].flatten
      error_msgs = object.errors.full_messages(options.slice(:order))
    else
      objects = params.map {|name| instance_variable_get("@#{name}") }.compact
      error_msgs = params.map do |name|
        order = case options[:order]
                when Array then options.slice(:order).map {|o| o.to_s }
                when Hash then {:order => options[:order][name].map {|o| o.to_s }}
                else {}
                end
        instance_variable_get("@#{name}").errors.full_messages(order)
      end.flatten.compact
    end

    count  = objects.inject(0) {|sum, object| sum + object.errors.count }
    unless count.zero?
      options[:object_name] ||= params.first

      I18n.with_options :locale => options[:locale], :scope => [:activerecord, :errors, :template] do |locale|
        message = options.include?(:message) ? options[:message] : locale.t(:body)
        error_messages = error_msgs.map {|msg| content_tag(:li, ERB::Util.html_escape(msg)) }

        contents = ''
        contents << content_tag(options[:header_tag] || :h2, options[:header_message]) unless options[:header_message].blank?
        contents << content_tag(:p, message) unless message.blank?
        contents << content_tag(:ul, error_messages)

        content_tag(:div, contents, options.slice(:class,:id))
      end
    else
      ''
    end
  end

end