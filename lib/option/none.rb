module None
  module_function

  def defined?
    false
  end

  def empty?
    true
  end

  def ==(that)
    that.class === None
  end

  def ===(that)
    self.== that
  end

  def map; end
end