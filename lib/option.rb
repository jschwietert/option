require 'option/version'
require 'option/some'
require 'option/none'

module Option
  module_function

  def new(known)
    if known
      Some.new known
    else
      None
    end
  end
end
