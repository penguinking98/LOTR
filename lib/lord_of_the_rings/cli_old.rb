#the app will operate by giving the user to input a character name on their own or be redirected to a step by set search based on attributes.
require_relative "books.rb"
require_relative "characters.rb"
require_relative "races.rb"

class LOTR:CLI

    def start
        puts ""
        puts "Welcome to the Lord of the Rings App!"
        puts "This will help you find out information on a character by name or by attributes you may know about them if you don't know their name!"
        ask_character
        #if the name is unknown then select no
        input = "a"
        until input == "z"
            puts ""
            puts "Thank you for your patience!"
            puts ""
            input = gets.strip.downcase
            if input != "n"
                yes_or_no(input)
            end                  
            puts ""
            puts "Thank you for using the Lord of the Rings app!"
            puts ""
            exit
        end
    
    
    def ask_character(character_arr)
        
    end

    def ask_book(book_arr)
        puts "This is a list of books to choose from!"
        puts ""
        puts "The Hobbit, The Fellowship of the Ring, The Two Towers, The Return of the King, The Silmarillion"
        puts "Please type in the title of the book you want!"
        puts ""
        #typing will autofill if possible 
        input = gets.strip
        puts "Give me a second to pull up the list of characters of this race."
        book = validate_input(input)
        race = Race.new(book)
        race.fetch.data
        puts "Give me a second to pull up the list of races that appear in this book!"
    end 

    #races that appear will change based on the book selected
    def ask_race(race_arr)
        puts "This is a list of races to choose from!"
        puts ""
        puts "Hobbit, Orc, Ent, Elf, Man, Dwarf"
        puts "Please type in the name of the race you want!"
        puts ""
        #typing will autofill if possible 
        input = gets.strip
        puts "Give me a second to pull up the list of characters of this race."
        race = validate_input(input)
        characters = Characters.new(race)
        characters.fetch.data
    end 
    def get_user_input 
        @input = gets.strip
    end
    def validate_input(input)
        
        race_array = ["Hobbit, Orc, Ent, Elf, Man, Dwarf"]
        until race_array.include? input.downcase
            puts "Please type in the race you want."
            input = gets.strip
        end     
        
        
        
        books_array = ["The Hobbit", "The Fellowship of the Ring", "The Two Towers", "The Return of the King", "The Silmarillion"]
        until books_array.include? input.downcase
            puts "Please type in the book you want."
            input = gets.strip
        end     
        input   
    end
    def yes_or_no(input)
        if input == "y" 
            ask_genre
        else 
            puts "Please enter a valid response!"
        end
    end
end