module HungryVegan
    class Restaurant 
        attr_accessor :id, :name, :address, :rating, :phone_number, :url, :website

        @@all = []

        def self.all
            @@all
        end 
        
    end 
end