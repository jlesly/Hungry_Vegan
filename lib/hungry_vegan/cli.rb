module HungryVegan
    class Cli
        attr_accessor = 

        def initialize
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
                
            else
                
            end

        end 

        def input 
        end
        
        def invalid_entry
        end

        def exit 
        end 

        def main_menu_option
        end 
    end
end