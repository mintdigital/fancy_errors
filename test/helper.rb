require 'rubygems'
require 'test/unit'
require 'context'
require 'matchy'

begin
  require 'redgreen'
rescue LoadError
end

# Define this error so Validations can be loaded without Base
class ActiveRecordError < StandardError; end
require 'i18n'
require 'active_record/validations'

require File.join(File.dirname(__FILE__), '../lib/fancy_errors')

# Mock out an AR::Base class
class Base
  attr_accessor :title, :snippet, :content
  class << self
    def human_attribute_name(a); a.to_s.capitalize; end
  end
end

module Kernel
  def silence_warnings
    old_verbose, $VERBOSE = $VERBOSE, nil
    yield
  ensure
    $VERBOSE = old_verbose
  end
end