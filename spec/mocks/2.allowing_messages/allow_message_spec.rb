describe 'Allowing messages' do
  example 'returns nil from allowed messages' do
    dbl = double('an obj double')

    # allow + receive
    allow(dbl).to receive(:foo)

    expect(dbl.foo).to be_nil
  end
end
