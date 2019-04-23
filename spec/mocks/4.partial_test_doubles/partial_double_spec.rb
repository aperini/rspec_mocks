# A partial double is an extension of a real object
describe 'A partial double' do

  context 'A very simple one' do
    my_string = 'a string'

    before do
      # redefines a method
      allow(my_string).to receive(:length).and_return(500)
    end

    it 'redefines only the specified methods' do
      expect(my_string.length).to eq(500)
      # reverse wasn't redefined
      expect(my_string.reverse).to eq('gnirts a')
    end
  end

  # Another example
  context 'A simple one' do
    class User
      def self.find(id)
        :original_return_value
      end
    end

    it 'redefines a method' do
      # given
      allow(User).to receive(:find).and_return(:redefined)

      # when
      found = User.find(3)

      # then
      expect(found).to eq(:redefined)
    end

    it 'restores the redefined method after the previous example completes' do
      # when
      found = User.find(3)

      # then
      expect(found).to eq(:original_return_value)
    end
  end
end
