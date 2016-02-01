require 'option'

describe Option do
  describe '#new' do
    it 'returns None if given nil' do
      expect(Option.new(nil)).to be None
    end

    #todo utilize same collection of test data used in Some's specs.
    it 'returns Some if given a string' do
      expect(Option.new('thing')).to be_an_instance_of Some
    end

    it 'returns Some if given a number' do
      expect(Option.new(1)).to be_an_instance_of Some
    end

    it 'returns Some if given an array' do
      expect(Option.new(['thing one', 'thing two'])).to be_an_instance_of Some
    end

    it 'returns Some if given a hash' do
      expect(Option.new([:one => 'thing one', :two => 'thing two'])).to be_an_instance_of Some
    end
  end

  describe 'case semantics' do
    it 'allows Some to be identified' do
      one = Option.new 1

      result =
        case one
          when None
            false
          when Some
            true
        end

      expect(result).to be == true
    end

    it 'allows None to be identified' do
      nothing = Option.new nil

      result =
          case nothing
            when Some
              true
            when None
              false
          end

      expect(result).to be == false
    end

    it 'allows Some to be identified by its contents' do
      one = Option.new 1

      result =
          case one
            when Some.new(2)
              false
            when Some.new(1)
              true
          end

      expect(result).to be == true
    end
  end
end