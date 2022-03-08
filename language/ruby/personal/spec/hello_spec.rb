require_relative '../hello'

RSpec.describe Greetings do
 context "#greetings" do
  it { expect(Greetings.say_hello).to eql 'Hello!' }
 end
end

