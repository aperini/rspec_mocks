describe "A negative message expectation" do
  it 'passes if the message is never received' do
    dbl = double('an obj double')
    expect(dbl).not_to receive(:foo)

    # if we call :foo the test fails
    # dbl.foo
  end
end
