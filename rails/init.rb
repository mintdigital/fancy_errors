module ::ActiveRecord
  module Validations
    def errors
      @errors ||= FancyErrors.new(self)
    end
  end
end