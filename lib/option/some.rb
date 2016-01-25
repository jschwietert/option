class Some
  def initialize(thing)
    raise ArgumentError.new("nil is not something") if thing == nil

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

  def map
    Option.new(yield @thing)
  end

  protected

  def get
    @thing
  end
end