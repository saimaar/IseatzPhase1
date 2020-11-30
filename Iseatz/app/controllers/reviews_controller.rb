require 'dotenv'
require 'json'
Dotenv.load

class ReviewsController < ApplicationController

  def reviews
    ##getting all the restaurants with the cuisine_id and entity_id
    # byebug
    begin
    @search_response = RestClient.get "https://developers.zomato.com/api/v2.1/search?entity_id=#{params["city_id"]}&entity_type=city&cuisines=#{params["cuisine_id"]}", {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}
    ## get the first 5 from the search_ response
    @restaurants = JSON.parse(@search_response.body)["restaurants"].slice(0,5)

    if @restaurants.empty?
      render json: {message: "No Reviews Found"}
    else
   ##mapping over each restaurant and making request to endpoint with each restaurant_id
    @reviews = @restaurants.map{|element|

      JSON.parse(RestClient.get "https://developers.zomato.com/api/v2.1/reviews?res_id=#{element["restaurant"]["R"]["res_id"]}", {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}).merge(:restaurant_name => element["restaurant"]["name"], :location => element["restaurant"]["location"],:cuisines => element["restaurant"]["cuisines"])
    }

    render json: {reviews: @reviews}
  end
  rescue => error
    @logger = Logger.new("my_log.txt")
    @logger.info(error.message)
    render json: {usermessage: "wrong input values", errormessage: error.message}

  end





  end ## end of method

end
