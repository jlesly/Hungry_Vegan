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
            elsif input.length==5 && input.to_i !=0
                @zip=input
                get_restaurants
                show_restaurants
                select_restaurant
            else
                invalid_entry
            end
                main_menu_option
        end 

        def invalid_entry
            puts "\nInvalid entry.\n"
        end
        
        def get_restaurants
            if @zip_array.include?(@zip)
            @restaurant_array= Restaurant.get_matching_restaurants(@zip)
            else
            @zip_array<<@zip 
            @restaurant_array= Restaurant.get_restaurants_from_zip(@zip)
            end
        end 

        def show_restaurants
            @restaurant_array.each.with_index(1) do |restaurant,i|
            puts "#{i}.#{restaurant.name}"
        end

        def select_restaurant
            puts "\nPlease type in the number of the restaurant you would like to view\n"
            puts "\nTo exit the program, enter 'exit'.\n"
            input= nil
            input = gets.strip
            if input.downcase == "exit"
                puts "\n\nExiting program. Come back soon!\n\n"
                exit
            elsif input.to_i>0 && input.to_i<=restaurant_array.size
                selected_restaurant_info(input)
            else puts "Error. Invalid entry."
                select_restaurant
            end 
        end 
        
        def selected_restaurant_info(index)
            if @restaurant_array[index.to_i-1].class==Restaurant
                restaurant=@restaurant_array[index.to_i-1]
            end 

            puts "\n\nHere's more information:\n\n"
            puts "Name: #{restaurant.name}"
            puts "Rating: #{restaurant.rating}"
            puts "Phone Number: #{restaurant.phone_number}"
        end 

        def main_menu_option
            puts "\n\nWould you like to enter another zip code? Type 'yes' or 'no'\n\n"
            input = gets.strip
            
            if input.downcase == "yes"
                call
            elsif input.downcase == "no"
                puts "\nGoodbye. Come back soon!\n"
            else
                invalid_entry
                main_menu_option
            end 
        end 

    end
end
end