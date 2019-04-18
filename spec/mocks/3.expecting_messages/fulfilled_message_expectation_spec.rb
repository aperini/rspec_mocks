describe 'A fulfilled positive message expectation' do
  it 'passes' do
    dbl = double('an obj double')
    expect(dbl).to receive(:foo)

    # if we don't call :foo the test fails
    dbl.foo
  end
end
