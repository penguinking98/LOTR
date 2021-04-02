class Character
    attr_accessor :name, :spouse, :race, :birth, :death, :realm, :hair, :height, :gender
    
    def is_valid?
        # Ignore characters with problem data (gender)
        return false if ['NaN','Males','male','','Most likely male', nil].include?(self.gender)
        return true 
    end
    def self.new_from_collection(characters)
        @@all = characters.select { |c| c.is_valid? }
            
    end
    def self.all
        @@all.clone
    end
    def to_s
        "Character  - #{name} "
    end
    
 
end
    