require 'option/some'

describe Some do
  SUPPORTED_DATA =
        ['thing',
         1,
         1.0,
         ['thing one', 'thing two'],
         [:one => 'thing one', :two => 'thing two']]

  def for_all
    SUPPORTED_DATA.each{ |thing| yield thing}
  end

  describe '#new' do
    it 'throws an exception if instantiated with nil' do
      expect{ Some.new(nil) }.to raise_error ArgumentError
    end

    it 'returns an instance when given some thing' do
      for_all{ |thing| expect(Some.new(thing)).to be_an_instance_of Some }
    end
  end

  describe '#defined?' do
    it 'is always defined' do
      for_all{ |thing| expect(Some.new(thing)).to be_defined }
    end
  end

  describe '#empty?' do
    it 'is never empty' do
      for_all{ |thing| expect(Some.new(thing)).not_to be_empty }
    end
  end

  describe '#==' do
    it 'returns true if the contents are the same' do
      for_all{ |thing| expect(Some.new(thing)).to be == Some.new(thing) }
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
      for_all{ |thing| expect(Some.new(thing)).not_to be None }
    end
  end

  describe '#map' do
    it 'applies the given block to the contents and returns the result in some if a non-nil value is returned' do
      for_all do |thing|
        result = Some.new(thing).map{ |contents| if contents != nil then 10 else nil end }

        expect(result).to be == Some.new(10)
      end
    end

    it 'applies the given block to the contents and returns none if the block returns nil' do
      for_all do |thing|
        result = Some.new(thing).map{ |contents| if contents == nil then 10 else nil end }

        expect(result).to be None
      end
    end
  end

  describe 'hashability' do
    xit 'uses the contents hash' do
    end

    xit 'uses the contents equals for hash equality' do
    end
  end
end