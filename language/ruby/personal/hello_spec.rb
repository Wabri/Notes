require 'minitest/autorun'
require_relative './hello'

describe Greetings do
  describe "#sayhello" do
    it "should return Hello!" do
      Greetings.say_hello.must_equal 'Hello!'
    end
  end
end

