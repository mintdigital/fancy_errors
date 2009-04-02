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
    (@errors[attribute.to_s] || []).inject([]) do |messages, msg|
      if attribute.to_s == 'base'
        messages << msg
      elsif msg =~ /^\^/
        messages << msg[1..-1]
      else
        attr_name = @base.class.human_attribute_name(attribute)
        messages << attr_name + I18n.t('activerecord.errors.format.separator', :default => ' ') + msg
      end
    end
  end
end
