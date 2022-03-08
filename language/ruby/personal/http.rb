# Import net/http
require 'net/http'
# Get request
http_response = Net::HTTP.get_response('www.example.com', '/')

puts http_response.code

# Parsing Http Response
require 'uri'
require 'json'
# Create uri (unform resourceidentifiers) object 
uri = URI('http://www.example.com/sample.json')
# Do get http request
response = Net::HTTP.get(uri)
# print the answer using json
json_response = JSON(response)

