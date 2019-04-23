# A lass_double is provided as a complement to instance_double with the difference that it
# verifies class methods on the given class rather than instance methods.

# It only checks for CLASS METHODS
# It doesn't check for INSTANCE METHODS
describe 'User#suspend!' do
  class ConsoleNotifier
    MAX_WIDTH = 80

    def self.notify(message)
      puts message
    end
  end

  class User
    def suspend!
      ConsoleNotifier.notify('user suspended')
    end
  end

  it 'notifies the console' do
    # given
    notifier = class_double('ConsoleNotifier')
               .as_stubbed_const(transfer_nested_constants: true)
    # 'as_stubbed_const' replaces concrete classes with the defined double
    # 'transfer_nested_constants' allows verifying declared constants

    # then
    expect(notifier).to receive(:notify).with('user suspended')
    expect(ConsoleNotifier::MAX_WIDTH).to eq(80)

    # when
    user = User.new
    user.suspend!
  end
end
