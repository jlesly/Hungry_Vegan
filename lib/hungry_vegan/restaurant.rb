module HungryVegan

class Restaurant 
    
    attr_accessor :id, :name, :address, :rating, :phone_number, :url, :zip, :matching_zip_codes

    @@all = []

        def initialize
            
        end 

        def self.all
            @@all
        end 

        def self.find_or_create(attributes_hash, zip)
            restaurant= self.all.find {|object| object.id ==attributes_hash["id"]}||self.create(attributes_hash, zip)
            restaurant.matching_zip_codes<<zip unless restaurant.matching_zip_codes.include?(zip)
            restaurant
        end 

        def self.create(hash, zip)
            restaurant = Restaurant.new 
            restaurant.id=hash["id"]
            restaurant.name=hash["name"]
            restaurant.rating=hash["rating"]
            restaurant.phone_number=hash["display_phone"]
            restaurant.url=hash["url"]
            restaurant.matching_zip_codes= [zip]
            self.all<<restaurant
            restaurant
        end 

        def self.get_restaurants_from_zip(zip)
            businesses= Api.search(term="vegan", zip) ["businesses"]
            businesses.collect do |business|
                if business.class== Hash
                    Restaurant.find_or_create(business, zip)
                end
            end 
        end 

        def self.get_matching_restaurats(zip)
            self.all.select{|r|r.matching_zip_codes.include?(zip)}
        end
end 
end