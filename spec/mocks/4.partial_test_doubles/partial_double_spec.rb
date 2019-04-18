describe 'A partial double' do

  context 'A very simple one' do
    my_string = 'a string'
    before do
      # this overrides the length method
      allow(my_string).to receive(:length).and_return(500)
    end

    it 'redefines the specified methods' do
      expect(my_string.length).to eq(500)
    end

    it 'does not effect other methods' do
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
      allow(User).to receive(:find).and_return(:redefined)
      expect(User.find(3)).to eq(:redefined)
    end

    it 'restores the redefined method after the example completes' do
      expect(User.find(3)).to eq(:original_return_value)
    end
  end
end
