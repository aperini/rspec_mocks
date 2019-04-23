describe 'A null object' do

  # to use 'as_null_object' I had to set mocks.syntax in the spec_helper

  it 'arbitrarily deep message chains and returns itself' do
    # given
    dbl = double('an obj double').as_null_object

    # when
    r = dbl.foo.bar.bazz

    # then
    expect(r).to be(dbl)
  end
end
