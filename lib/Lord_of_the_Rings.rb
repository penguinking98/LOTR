require 'pry'
require 'httparty'
require 'dotenv/load'
require 'json'


require_relative "Lord_of_the_Rings/version"
require_relative "Lord_of_the_Rings/cli"
require_relative "Lord_of_the_Rings/api"
require_relative "Lord_of_the_Rings/LOTR"

module LOTR
  class Error < StandardError; end
  # Your code goes here...
end