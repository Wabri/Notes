# If-else statement
x = 7
if x < 7
  puts "x is less than 7"
elsif x > 7
  puts "x is greater than 7"
else
  puts "x is equal than 7"
end

# Unless statement
playing = false

# if the condition is false than run the code block
unless playing
  puts "We are busy learning Ruby"
else
  puts "It's time to play games"
end

# Logical Operators
# &&
test = false && true # false
test = true && true # true
# ||
test = false || false # false
test = true || false # true
# !
test = !true # false
test = !false # true

# Switch case
num = 3
case num
when 0
  puts "Zero"
when 1
  puts "One"
when 2
  puts "Two"
when 3
  puts "Three"
when 4
  puts "Four"
else
  puts "The number is higher than four"
end

# While
count = 1

while count < 5
  puts count
  count = count + 1
end
=begin
  output:
    1
    2
    3
    4
=end

# Until
count = 5

until count > 10
  puts count
  count = count + 1
end
=begin
  Output:
    5
    6
    7
    8
    9
    10
=end

# For
for count in 1...5
  puts count
end
=begin
  Output:
    1
    2
    3
    4
=end

# Iterators
5.times { puts "I am Learning Ruby!"}
=begin
  Output:
    I am Learning Ruby!
    I am Learning Ruby!
    I am Learning Ruby!
    I am Learning Ruby!
    I am Learning Ruby!
=end

days = [
  'Monday', 
  'Tuesday', 
  'Wednsday', 
  'Thursday', 
  'Friday', 
  'Saturday', 
  'Sunday'
]

days.each { |day| puts day }
=begin
  Output:
    Monday
    Tuesday
    Wednesday
    Thursday
    Friday
    Saturday
    Sunday
=end

2.times do
  puts "This is a code block!"
end
