require_relative "hungry_vegan/version"
require_relative "hungry_vegan/api"
require_relative "hungry_vegan/cli"
require_relative "hungry_vegan/restaurant"

require "http"
require "pry"
require "dotenv/load"


module HungryVegan
  class Error < StandardError; end
  # Your code goes here...
end
