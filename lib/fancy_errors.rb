class FancyErrors < ActiveRecord::Errors
  def full_messages(options = {})
    if options[:order] && order = options[:order].map {|a| a.to_s }
      # add attrs specified in order
      ordered_attrs = order & @errors.keys
      ordered_attrs += @errors.keys - order
    end

    (ordered_attrs||@errors.keys).inject([]) do |full_messages, a|
      full_messages.concat(full_messages_on(a))
    end
  end

  def full_messages_on(attribute)
    (@errors[attribute.to_s] || []).inject([]) do |messages, error|
      msg = error.full_message
      attr_name = @base.class.human_attribute_name(attribute)
      if attribute.to_s == 'base'
        messages << msg
      elsif msg =~ /^#{attr_name} \^/
        messages << msg.gsub(/^#{attr_name} \^/,'')
      else
        messages << msg
      end
    end
  end
end
