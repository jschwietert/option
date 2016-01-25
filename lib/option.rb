require 'option/version'
require 'option/some'
require 'option/none'

module Option
  def self.new(unknown)
    unknown.nil? ? None : Some.new(unknown)
  end
end
