require_relative "lotr_api.rb"
require "readline"
require "pry"


class CLI
    #create a pool of all available characters
    def fetch_character_pool
        api = LotrApi.new
        @pool = api.get_characters.sort_by {|c| c.name}
        
    end
    #narrow pool by gender
    def prompt_user_narrow_by_gender
        puts "Please select, from the following genders that appear in Lord of the Rings: "
         # Show distinct list of genders
        genders = @pool.collect {|character| character.gender}.uniq       
        genders.each_with_index{|gender, i| puts "\t#{i+1}. #{gender}" }
        # Ask user to type in a gender number
        input = Readline.readline("> ", true)
        choice = genders[input.to_i-1]
        puts "You picked : #{choice}"
        # Narrow the pool by gender
        @pool.delete_if {|character| character.gender == choice}
        # Tell user how many characters in pool now
        puts "Character pool is now #{@pool.size} characters."
    end
    #narrow pool by race
    def prompt_user_narrow_by_race
        #show list of races
        puts "Please select from the following races."
        race = @pool.collect {|character| character.race}.uniq     
        race.each_with_index{|race, i| puts "\t#{i+1}. #{race}" }
        #ask users to type in race number
        input = Readline.readline("> ", true)
        choice = race[input.to_i-1]
        puts "You picked : #{choice}" 
        #narrow pool by race
        @pool.delete_if {|character| character.gender == choice}
         # Tell user how many characters in pool now
         puts "Character pool is now #{@pool.size} characters."

    end
    #def prompt_user_narrow_by_realm
        #puts "Please select from the following ages."
        #realm = @pool.collect {|character| character.realm}.uniq     
        #realm.each_with_index{|age, i| puts "\t#{i+1}. #{realm}" }
        #ask users to type in race number
       # input = Readline.readline("> ", true)
       # choice = realm[input.to_i-1]
       # puts "You picked : #{choice}" 
    #    #narrow pool by race
      #  @pool.delete_if {|character| character.realm == choice}
         # Tell user how many characters in pool now
       #  puts "Character pool is now #{@pool.size} characters."
    
   # end
    
    def show_matches
        puts "The following #{@pool.size} characters match your criteria."
        @pool.each {|character| puts "\t#{character}"}
    end
    
    #def_valid_input
    #end
end

cli = CLI.new
cli.fetch_character_pool 
cli.prompt_user_narrow_by_gender
cli.prompt_user_narrow_by_race
#cli.prompt_user_narrow_by_realm

cli.show_matches   




#possibly define a method to exclude invalid inputs?
#current bug: hitting enter will register a valid input without typing in a number and a 1200 line response comes out