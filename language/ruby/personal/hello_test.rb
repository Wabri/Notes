require 'minitest/autorun'
require_relative './hello'

class GreetingsTest < Minitest::Test
  def test_greetings
      assert_equal 'Hello!', Greetings.say_hello, "Greetings.say_hello should return 'Hello!'"
  end
end

