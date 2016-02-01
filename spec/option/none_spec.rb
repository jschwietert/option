require 'option/none'

describe None do
  describe 'singleton properties' do
    it 'cannot be instantiated' do
      expect{ None.new }.to raise_error NoMethodError
    end

    it 'has only one reference' do
      expect(None.object_id).to be None.object_id
    end
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