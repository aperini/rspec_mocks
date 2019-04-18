describe 'A test double' do

  # Doubles are strict by default
  it 'raises errors when 2.allowing_messages not allowed or expected are received' do
    expect {
      dbl = double('Something')

      # this raises an error
      dbl.foo
    }.to raise_error(RSpec::Mocks::MockExpectationError)
  end

  # A hash can be used to define allowed 2.allowing_messages and return values
  it 'returns canned responses from the methods named in the provided hash' do
    dbl = double('Something', :foo => 3, :bar => 4)
    # OR dbl = double('Something', foo: 3, bar: 4)
    expect(dbl.foo).to eq(3)
    expect(dbl.bar).to eq(4)

    # OR
    responses_hash = { foo: 3, bar: 4 }
    dbl = double('Something', responses_hash)
    expect(dbl.foo).to eq(3)
    expect(dbl.bar).to eq(4)
  end
end
