# An instance_double is the most common type of verifying double. It takes a class name or
# object as its first argument, then verifies that any methods being stubbed would be present
# on an instance of that class. In addition, when it receives messages, it verifies that the
# provided arguments are supported by the method signature, both in terms of arity and
# allowed or required keyword arguments, if any.

# It only checks for INSTANCE METHODS
# It doesn't check for CLASS METHODS
describe 'User#suspend!' do
  class ConsoleNotifier
    def notify(msg)
      puts msg
    end
  end

  class User
    def initialize(notifier)
      @notifier = notifier
    end

    def suspend!
      @notifier.notify('user suspended')
    end
  end

  it 'notifies the console' do
    # given
    notifier = instance_double('ConsoleNotifier')

    # then
    expect(notifier).to receive(:notify).with('user suspended')

    # when
    user = User.new(notifier)
    user.suspend!
  end
end
