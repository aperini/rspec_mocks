describe 'A spy x partial double' do

  class Invitation
    def self.deliver
      'sth was delivered'
    end
  end

  it 'double: passes when the expectation is met' do
    # given
    allow(Invitation).to receive(:deliver)

    # when
    Invitation.deliver

    # then
    # 'have_received' is only applicable to stubbed methods
    expect(Invitation).to have_received(:deliver)
  end

  it 'spy: passes when the expectation is met' do
    # given
    invitation = spy(Invitation)

    # when
    invitation.deliver

    # then
    # 'have_received' is only applicable stubbed methods
    expect(invitation).to have_received(:deliver)
  end
end
