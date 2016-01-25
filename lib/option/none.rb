module None
  def self.defined?
    false
  end

  def self.empty?
    true
  end

  def self.==(that)
    that.class == self.class
  end

  def self.map; end
end