# The concept of object double is pretty much similar to instance or class
# doubles except for the fact that you pass an existing 'template' object
# to it on which stubbing and mocking is done allowed or required keyword
# arguments, if any.

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
    notifier = ConsoleNotifier.new
    obj_double = object_double(notifier)

    # then
    expect(obj_double).to receive(:notify).with('user suspended')

    # when
    user = User.new(obj_double)
    user.suspend!
  end
end
