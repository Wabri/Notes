# Declaration of array
months = [
  "January", #0
  "February", #1
  "March", #2
  "April", #3
  "May", #4
  "June", #5
  "July" #6
] 

# Refer to an item
puts months[6]

# Add new item
months << "August"
months.push("Semptember")
months.insert(2, "October")
puts months
=begin
  Output:
    January
    February
    October
    March
    April
    May
    June
    July
    August
    Semptember
=end

# Remove
months.pop
puts months # delete September
months.delete_at(2) # delete October
puts months

# Declaration of array of array
my_2d_array = [
  [1,2,3,4],
  [5,6,7,8]
]
puts my_2d_array[1][1]
my_2d_array.each { |x| puts "#{x}" }

# Include
my_array = [7,13,9,5,11]
puts my_array.include?(0)
puts my_array.include?(7)

# Sort
puts my_array.sort

# Flatten
puts my_2d_array.flatten

# Map
puts my_array.map { |item| item**2 }


# Declaration method Hash #1
person_hash = Hash.new

# Declaration method Hash #2
person_hash = {
  "name" => "Jonathan",
  "age" => 25
}

# Access hash values
puts person_hash["name"]
puts person_hash["age"]

# Add to hash
person_hash["gender"] = 'male'
puts person_hash
=begin
  Output:
   {"name"=>"Jonathan", "age"=>25, "gender"=>"male"} 
=end

# Remove from hash 
person_hash.delete("gender")
puts person_hash
=begin
  Output:
   {"name"=>"Jonathan", "age"=>25} 
=end

# Iterating over hashes
person_hash.each do |key, value|
  puts "#{key} is #{value}"
end

# Has_key?
puts person_hash.has_key?("name")
puts person_hash.has_key?("surname")

# Select
puts person_hash.select{ |key| key == "name" }

# Select
puts person_hash.fetch("name")

# Declaration of Sets
require 'set' # import set class and methods
my_set = Set.new
my_set = Set.new([5,9,2,3,1])
print my_set
=begin
  Output:
    #<Set: {5, 9, 2, 3, 1}>
=end

my_set.each do |x|
  puts x
end
=begin
  Output:
    5
    9
    2
    3
    1
=end

# Adding to Set
my_set << 4
my_set.add 0
print my_set

# Ranges
# exclusive range
for count in 1...6
  puts count
end
=begin
  Output:
    1
    2
    3
    4
    5
=end

# inclusive range
for count in 1..6
  puts count
end
=begin
  Output:
    1
    2
    3
    4
    5
    6
=end

# Using the new method 
my_range = Range.new(1,6)
my_range.each{ |i| puts i }
=begin
  Output:
    1
    2
    3
    4
    5
    6
=end

