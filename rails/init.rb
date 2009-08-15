module ::ActiveRecord
  module Validations
    def errors
      @errors ||= FancyErrors.new(self)
    end
  end
end

::ActionView::Base.send(:include, FancyErrorsHelper)
