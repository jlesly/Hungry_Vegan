module HungryVegan
    class Cli
        attr_accessor :restaurant_array, :zip_array, :zip

        def initialize
            @zip_array = []
        end

        def call
            puts "\nWelcome to Hungry Vegan!\n"
            puts "\nType in your 5-digit zip code to get a list of restaurants in your area or type 'exit' to leave the program.\n"

            input = nil
            input = gets.strip

            if input.downcase == "exit"
                puts "\nExiting program. Come back soon!\n"
                exit
            elsif 
                input.length==5 && input.to_i !=0
                @zip= input
                get_restaurants
                show_restaurants
                select_restaurant

            else
                invalid_entry
            end

        end 

        def get_restaurants
            if @zip_array.include?(@zip)
                @restaurant_array= Restaurant.get_matching_restaurats(@zip)    
            else 
                @zip_array<<@zip
                @restaurant_array= Restaurant.get_restaurants_from_zip(@zip)
            end
        end

        def show_restaurants 
        end 
        
        def invalid_entry
            puts "\nInvalid entry.\n"
        end

        def main_menu_option
        end 
    end
end