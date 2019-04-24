describe 'A spy x partial double' do

  class Invitation
    def self.deliver
      'sth was delivered'
    end
  end

  it 'spy as double: passes when expectations are met' do
    # given
    # doing this 'allow' turns Invitation into a spy available for inspection
    allow(Invitation).to receive(:deliver)

    # when
    Invitation.deliver

    # then
    # 'have_received' is only applicable to stubbed methods
    # this expectation is not mandatory just because the method was called
    expect(Invitation).to have_received(:deliver)
  end

  it 'spy as spy: passes when expectations are met' do
    # given
    invitation = spy(Invitation)

    # when
    invitation.deliver

    # then
    # 'have_received' is only applicable stubbed methods
    # this expectation is not mandatory just because the method was called
    expect(invitation).to have_received(:deliver)
  end
end
