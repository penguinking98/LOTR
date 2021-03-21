
require 'net/http'
require 'open-uri'
require 'json'
require_relative 'character'

class LotrApi 

    def get_characters
        uri = URI('https://the-one-api.dev/v2/character')
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = 'Bearer nn216ImArhVn8ui3f0rU'

        puts 'Fetching Character Data...'
        res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
            http.request(req)
        }
        if res.is_a?(Net::HTTPSuccess)
            puts 'Yay'
        else 
            puts "Ya failed."
        end
        data = JSON.parse(res.body)
        characterdata = data['docs']
        puts "Parsed #{characterdata.size} characters"
        characters = []
        characterdata.each {|characterstuff|
            character = Character.new 
            character.name = characterstuff['name']
            character.spouse = characterstuff['spouse']
            character.race = characterstuff['race']
            character.birth = characterstuff['birth']
            character.death = characterstuff['death']
            character.realm = characterstuff['realm']
            character.hair = characterstuff['hair']
            character.height = characterstuff['height']
            character.gender = characterstuff['gender']
           

           characters << character
        }
      
        return characters
    end
end