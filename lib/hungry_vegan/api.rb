module HungryVegan
    
    class Api 

        API_HOST = "https://api.yelp.com"
        SEARCH_PATH = "/v3/businesses/search"
        BUSINESS_PATH = "/v3/businesses/"
        SEARCH_LIMIT = 20

        def self.search(term, location)
            url = "#{API_HOST}#{SEARCH_PATH}"
            params = {
                term: term, 
                location: location, 
                limit: SEARCH_LIMIT,
                sort_by: "rating"
            }
            response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url, params: params)
            response.parse
        end 
    end 
end 
