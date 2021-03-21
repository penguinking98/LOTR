require_relative "lotr_api.rb"

api = LotrApi.new
puts api.get_characters.sort_by {|c| c.name}