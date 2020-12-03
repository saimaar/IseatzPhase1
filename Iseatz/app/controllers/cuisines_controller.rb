require 'dotenv'
require 'json'
Dotenv.load

class CuisinesController < ApplicationController

  def cuisines
   @response = RestClient.get "https://developers.zomato.com/api/v2.1/cities?q=#{params["city"]}", {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}
   ## the response that we get from the API is a RestClient::Response which is a subclass of string.
   ## When we recieve info as string, we need to parse into json object and key values and so we use the JSON.parse method here.
   ## The response gives us more than one cities under the same city name so I choose the first one that comes and index into it and saved it to city_info
   @city_info = JSON.parse(@response.body)["location_suggestions"][0]
# debugger
## if the city info is true then we send requst to the cusines endpoint
   if @city_info
     @cuisines = RestClient.get "https://developers.zomato.com/api/v2.1/cuisines?city_id=#{@city_info["id"]}", {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}
     render json: JSON.parse(@cuisines.body).merge({:city => @city_info})
   else
     render json: {message: "City Not Found", error: 404}
   end

  end



end ##end of class
