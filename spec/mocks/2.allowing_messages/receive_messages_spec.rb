describe 'Receiving messages' do
  example 'configures return values for the provided messages' do
    responses_hash = { foo: 3, foo2: 3, bar: 4 }
    dbl = double('an obj double')

    # allows receive, not an obligation
    allow(dbl).to receive_messages(responses_hash)

    expect(dbl.foo).to eq(3)
    expect(dbl.bar).to eq(4)
  end
end
