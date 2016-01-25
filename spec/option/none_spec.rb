require 'option/none'

describe None do
  it 'is a singleton' do
    expect(None).to be None
  end

  describe '#defined?' do
    it 'is not defined' do
      expect(None).not_to be_defined
    end
  end

  describe '#empty?' do
    it 'is empty' do
      expect(None).to be_empty
    end
  end

  describe '#==' do
    it 'is true for None' do
      expect(None).to be == None
    end

    it 'is false for any Some' do
      expect(None).not_to be == Some.new(1)
    end
  end

  describe '#map' do
    it 'should not execute the given block' do
      expect{ None.map{ |_| raise StandardError } }.not_to raise_error
    end
  end
end