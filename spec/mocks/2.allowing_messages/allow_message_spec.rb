describe 'Allowing messages' do
  example 'returns nil from allowed messages' do
    dbl = double('an obj double')

    # allows receive, not an obligation
    allow(dbl).to receive(:foo)
    allow(dbl).to receive(:foo2)

    expect(dbl.foo).to be_nil
  end
end
