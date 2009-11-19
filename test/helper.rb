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
gem 'activerecord', '=2.3.4'
require 'active_record/validations'


require File.join(File.dirname(__FILE__), '../lib/fancy_errors')

# Mock out an AR::Base class
class Base
  attr_accessor :title, :snippet, :content
  class << self
    def human_attribute_name(a); a.to_s.capitalize; end
    def human_name; self.to_s; end
    def self_and_descendants_from_active_record; [self]; end
  end
end
# other rails helpers that aren't included
class String
  def underscore
    self
  end
end
class Hash
  def reverse_merge!(other)
    replace(other.merge(self))
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