#book data will be pulled from the api and output 
#as an array where they can then type the number to reveal info on the book.



  require 'net/http'
  require 'open-uri'
  require 'json'



  class Getbooks
  
    URL = "https://the-one-api.dev/v2/book"
  
    def get_books
      uri = URI.parse(URL)
      response = Net::HTTP.get_response(uri)
      response.body
    end
 
  end
  
  books = Getbooks.new.get_books
  puts books 

  