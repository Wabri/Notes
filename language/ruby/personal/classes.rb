# Create Class
class MyClass

  # Constructor
  def initialize
    puts "The object is now created"
  end

end

# Create object
myObj = MyClass.new

# Create Class with instance variables
class MyClass2

  # Contructor with argument
  def initialize(brand)
    @brand = brand # Instance variable
  end

end

# Create object with argument
myObj = MyClass2.new("Test")

# Class and Instance methods
class MyClass3

  def self.class_greetings
    puts "Class method"
  end
  
  def instance_greetings
    puts "Instance method"
  end

end

MyClass3.class_greetings
# MyClass3.instance_greetings # <= this throws an error
myObj = MyClass3.new
myObj.instance_greetings

# Class and Instance variables
class MyClass4

  @@count = 0 ## class variable, this is != from @count

  def initialize
    @@count += 1
  end

  def self.get_instance_count
    @@count
  end

end

myObj = MyClass4.new
myObj2 = MyClass4.new
myObj3 = MyClass4.new

# puts myObj.get_instance_count # <= this throws an error
puts MyClass4.get_instance_count
# Outputs: 3

# Mixins for inheritance
module Greetings
  def say_hello
    puts "Hello!"
  end
end

class Person
  include Greetings # as instance methods
end

p1 = Person.new
p1.say_hello
# Person.say_hello # <= this throws an error

class Person2
  extend Greetings # as class methods
end

p2 = Person2.new
# p2.say_hello # <= this throws an error
Person2.say_hello

