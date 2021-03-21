require_relative "lotr_api.rb"
require "readline"



class CLI
    def fetch_character_pool
        api = LotrApi.new
        @pool = api.get_characters.sort_by {|c| c.name}
        
    end
    def prompt_user_narrow_by_gender
        puts "Please select from the following genders that appear in Lord of the Rings: "
         # Show distinct list of genders
        genders = @pool.collect {|character| character.gender}.uniq       
        genders.each_with_index{|gender, i| puts "\t#{i+1}. #{gender}" }
        # Ask user to type in a gender number2
        input = Readline.readline("> ", true)
        choice = genders[input.to_i-1]
        puts "You picked : #{choice}"
        # Narrow the pool by gender
        @pool.delete_if {|character| character.gender == choice}
        # Tell user how many characters in pool now
        puts "Character pool is now #{@pool.size} characters."
    end
    def show_matches
        puts "The following #{@pool.size} characters match your criteria."
        @pool.each {|character| puts "\t#{character}"}
    end
       
end

cli = CLI.new
cli.fetch_character_pool 
cli.prompt_user_narrow_by_gender
#cli.prompt_user_narrow_by_race
#cli.show_matches   



