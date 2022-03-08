# File
# Create a file
test_file = File.new("test.txt", "w+")
test_file.puts("We're writings some text to file")
test_file.close

# Read file
puts File.read("test.txt")

# Open file
File.open("test.txt", "w+") {
  |file| file.puts("This is will substitute the other text")
}
# This not need the close method because we run in a code block  

puts File.read("test.txt")

# Append to file
File.open("test.txt", "a+") {
  |file| file.puts("This will be a new line")
}

puts File.read("test.txt")

