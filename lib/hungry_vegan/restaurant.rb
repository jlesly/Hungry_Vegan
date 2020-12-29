module HungryVegan
    class Restaurant 
        attr_accessor :id, :name, :address, :rating, :phone_number, :url, :website, :zip

        @@all = []

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
            restaurant.id= hash["id"]
            restaurant.name= hash["name"]
            restaurant.rating= hash["rating"]
            restaurant.phone_number= hash["display_phone"]
            restaurant.url= hash["url"]
            restaurant.matching_zip_codes= [zip]
            self.all<<restaurant
        end 
        
        def self.get_restaurants_from_zip(zip)
            businesses= Api.search(term="vegan", zip) ["businesses"]
            business.collect do |business|

end