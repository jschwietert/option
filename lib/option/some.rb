class Some
  def initialize(thing)
    fail ArgumentError, "nil is not something" unless thing

    @thing = thing
  end

  def defined?
    true
  end

  def empty?
    false
  end

  def ==(that)
    that.class == self.class && that.get == @thing
  end

  def hash
    @thing.hash
  end

  def map
    Option.new(yield @thing)
  end

  alias_method :eql?, :==

  protected

  def get
    @thing
  end
end