describe 'spy - have_received' do

  it 'passes when the message has been received' do
    # given
    invitation = spy('invitation')

    # when
    invitation.any_method

    # then
    expect(invitation).to have_received(:any_method)

    # a spy('invitation') returns itself for undefined methods
    # a double('invitation') would cause an error
    expect(invitation.any_method).to be(invitation)
  end
end
