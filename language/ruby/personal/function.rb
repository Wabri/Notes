# FUNCTION
# Declaration
def greetings 
  puts "Hello!"
end

# Calling
greetings

# Arguments
def greetings_with_name(name="Default")
  puts "Hello #{name}"
end

greetings_with_name
greetings_with_name("Gabriele")

def sum(x, y)
  x + y
end

puts sum(2, 9)

# Call function multiple times
def optional_arguments(*a)
  puts a
end

optional_arguments("Hello", "World", 2021)

# Return values
def prod(x, y)
  res = x*y
  return res
end

result = prod(2, 5)
puts result
# Output: 10

# Return implicito
# L'ultima istruzione eseguita sarà il ritorno della funzione
def implicit_return
  x = 10
  if x == 10
    x = true
  else
    x = false
  end
end

puts implicit_return
# Outputs: true 

# Yield
def yielding_test
  x = 10
  puts "This is a test #{x}"
  yield
  puts "This is after the yield #{x}"
end

x = 5
yielding_test { puts "This is the yield #{x}" } 
=begin
  Outputs:
   This is a test 10
   This is the yield 5
   This is after the yield 10
=end

# Yield parameters
def yielding_test(name)
  puts "This is a test #{name}"
  yield("Wabri", "Pula")
  puts "In between yields"
  yield(name)
  puts "After the yields #{name}"
end

yielding_test("Gabriele") { |first,second| puts "Hello #{first}#{second}." }

