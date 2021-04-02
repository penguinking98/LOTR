require_relative "lotr_api.rb"
require "readline"
require "pry"


class CLI
    
    def call
       
        while true do
            @restart = false
            greeting 
            fetch_character_pool 
            prompt_user_narrow_by_gender
            next if @restart
            prompt_user_narrow_by_race
            next if @restart
            prompt_user_narrow_by_name
            next if @restart
            show_matches  
             
            thanks
        end
    end
    def greeting
        puts "Hello, this is the Lord of the Rings character app. You can find a character by typing in a number. You may type Q at any point to exit the app or R to restart."
    end
    def handle_restart_choice(choice)
        if ['R','RESTART'].include?(choice.upcase)
           @restart = true
            puts "Restarting...\n\n"
        end
    end

   def handle_quit_choice(choice)
    if ['Q','QUIT','EXIT'].include?(choice.upcase)
        thanks
        exit(0)
     end
    end
    #create a pool of all available characters
    def fetch_character_pool
        api = LotrApi.new
        @pool = api.get_characters.sort_by {|c| c.name}
        
    end
    #narrow pool by gender
    def prompt_user_narrow_by_gender
        valid = false
        input_int = nil
        until valid do 
            puts "Please select from the following genders that appear in Lord of the Rings or type Q to restart: "
            # Show distinct list of genders
            genders = @pool.collect {|character| character.gender}.uniq.compact       
            genders.each_with_index{|gender, i| puts "\t#{i+1}. #{gender}" }
            # Ask user to type in a gender number
            input = Readline.readline("> ", true)
            handle_quit_choice(input)
            handle_restart_choice(input)
            return if @restart
            input_int = input.to_i
            valid = input_int.between?(1,genders.size)
        end
        choice = genders[input_int - 1]
        puts "You picked : #{choice}"
        # Narrow the pool by gender
        @pool.delete_if {|character| character.gender == choice}
        # Tell user how many characters in pool now
        puts "Character pool is now #{@pool.size} characters."
        
    end
        
    #narrow pool by race
    def prompt_user_narrow_by_race
        #show list of races
        puts "Please select from the following races or type Q to restart."
        race = @pool.collect {|character| character.race}.uniq.compact    
        race.each_with_index{|race, i| puts "\t#{i+1}. #{race}" }
        #ask users to type in race number
        input = Readline.readline("> ", true)
        handle_quit_choice(input)
        handle_restart_choice(input)
        return if @restart
        choice = race[input.to_i-1]
        puts "You picked : #{choice}" 
        #narrow pool by race
        @pool.delete_if {|character| character.race == choice}
         # Tell user how many characters in pool now
         puts "Character pool is now #{@pool.size} characters."

    end
    def prompt_user_narrow_by_name
        #show list of races
        puts "Please select from the following names or type Q to restart."
        name = @pool.collect {|character| character.name}.uniq.compact    
        name.each_with_index{|name, i| puts "\t#{i+1}. #{name}" }
        #ask users to type in name number
        input = Readline.readline("> ", true)
        handle_quit_choice(input)
        handle_restart_choice(input)
        return if @restart
        choice = name[input.to_i-1]
        puts "You picked : #{choice}" 
        #narrow pool by race
        @pool.delete_if {|character| character.name== choice}
         # Tell user how many characters in pool now
         puts "Character pool is now #{@pool.size} characters."

    end
    
       
    def show_matches
        puts "The following #{@pool.size} characters match your criteria."
        @pool.each {|character| puts "\t#{character}"}
    end
    def thanks
        puts "Thank you for using my Lord of the Rings app!"
    end
   
end

    CLI.new.call


#q to quit or r to return to the beginning of the app
#expand on this to list characters in a number pool and find info specific to the character
#possibly define a method to exclude invalid inputs?
#current bug: hitting enter will register a valid input without typing in a number and a 1200 line response comes out
#add looping 
#create bin file and utilize the character class as an object
#promtp user to find out specific info on a character or loop back to start over
#eliminate the multiple versions of male and merge them