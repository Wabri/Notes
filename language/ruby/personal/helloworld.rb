# This is a comment

=begin 
  This is
  a multiline
  comment
=end

=begin 
  Il comando puts stampa in output
  Anche il comando print stampa in output, ma non prevede di andare a capo
=end
puts "Hello World!"
print "Hello World"
print "!"
=begin 
  Output:
    Hello World!
    Hello World!
=end

=begin 
  Ruby è case-sensitive: rails e Rails sono consdierati differenti .
  Convenzione vuole che gli idetificatori inizino con una lettera maiuscola.
=end
my_var = 5
puts my_var

# Sommma tra due numeri
x = 5.0
y = 3
sum = x + y
sub = x - y
mul = x * y
div = x / y
mod = x % y
puts sum
puts sub
puts mul
puts div
puts mod
=begin 
  Output:
  5
  8.0
  15.0
  1.666666666667
  2.0
=end

# Rilevazione automatica dei tipo di dato
name = "Gabriele"
age = 29
# Interpolation di stringhe #{var}
puts "Il nome è #{name} e l'età è #{age} anni!"
# Concatenation di stringhe
surname = "Puliti"
puts name + " " + surname + " #{age}"
=begin
  Note: this is a wrong concatenation
    puts name + " " + surname + " " + age
  No implicit conversion of Integer into String 
=end

# Manipolazione stringhe
string = "I love Ruby"
puts string.length
puts string.reverse
puts string.downcase
puts string.upcase

