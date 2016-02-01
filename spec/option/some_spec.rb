require 'option/some'

describe Some do
  def supported_data
    ['thing',
     1,
     1.0,
     ['thing one', 'thing two'],
     [:one => 'thing one', :two => 'thing two']]
  end

  describe '#new' do
    it 'throws an exception if instantiated with nil' do
      expect{ Some.new(nil) }.to raise_error ArgumentError
    end

    it 'returns an instance when given some thing' do
      supported_data.each{ |thing| expect(Some.new(thing)).to be_an_instance_of Some }
    end
  end

  describe '#defined?' do
    it 'is always defined' do
      supported_data.each{ |thing| expect(Some.new(thing)).to be_defined }
    end
  end

  describe '#empty?' do
    it 'is never empty' do
      supported_data.each{ |thing| expect(Some.new(thing)).not_to be_empty }
    end
  end

  describe '#==' do
    it 'returns true if the contents are the same' do
      supported_data.each{ |thing| expect(Some.new(thing)).to be == Some.new(thing) }
    end

    it 'returns false if the contents are different' do
      #todo use a for_all to test all supported data types
      expect(Some.new(1)).not_to be == Some.new(2)
    end

    it 'returns false if the content types are different' do
      #todo use a for_all to test all supported data types
      expect(Some.new(1)).not_to be == Some.new('1')
    end

    it 'returns false if compared to None' do
      supported_data.each{ |thing| expect(Some.new(thing)).not_to be None }
    end
  end

  describe '#map' do
    it 'applies the given block to the contents and returns the result in some if a non-nil value is returned' do
      supported_data.each do |thing|
        result = Some.new(thing).map{ |contents| contents ? 10 : nil }

        expect(result).to be == Some.new(10)
      end
    end

    it 'applies the given block to the contents and returns none if the block returns nil' do
      supported_data.each do |thing|
        result = Some.new(thing).map{ |contents| contents ? nil : 10 }

        expect(result).to be None
      end
    end
  end

  describe 'hashability' do
    it 'treats the same content as one unique key' do
      hash_of_somes = {Some.new(1) => 'some one', Some.new(1) => 'another one'}

      expect(hash_of_somes.size).to be == 1
    end

    it 'treats different content as two unique keys' do
      hash_of_somes = {Some.new(1) => 'some one', Some.new("1") => 'just one string'}

      expect(hash_of_somes.size).to be == 2
    end

    it 'treats content and the raw value of the content as two unique keys' do
      hash_of_somes = {Some.new(1) => 'some one', 1 => 'the number'}

      expect(hash_of_somes.size).to be == 2
    end
  end
end