describe 'A null object' do
  it 'arbitrarily deep message chains and returns itself' do
    # to use as_null_object I had to set mocks.syntax in the spec_helper
    dbl = double('an obj double').as_null_object
    expect(dbl.foo.bar.bazz).to be(dbl)
  end
end
