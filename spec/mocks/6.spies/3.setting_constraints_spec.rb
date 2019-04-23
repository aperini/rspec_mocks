describe 'Spy constraints' do
  let(:invitation) { spy('invitation') }

  FOO = 'foo@example.com'.freeze
  BAR = 'bar@example.com'.freeze

  # this will run before EVERY example/it
  before do
    invitation.deliver(FOO)
    invitation.deliver(BAR)
  end

  it 'passes when a count constraint is satisfied' do
    expect(invitation).to have_received(:deliver).twice
    expect(invitation).to have_received(:deliver).at_least(2).times
  end

  it 'passes when an order constraint is satisifed' do
    expect(invitation).to have_received(:deliver)
      .with(FOO).ordered
    expect(invitation).to have_received(:deliver)
      .with(BAR).ordered
  end

  it 'fails when a count constraint is not satisfied' do
    # expect(invitation).to have_received(:deliver).at_least(3).times
  end

  it 'fails when an order constraint is not satisifed' do
    # expect(invitation).to have_received(:deliver).with(BAR).ordered
    # expect(invitation).to have_received(:deliver).with(BAR).ordered
  end
end
