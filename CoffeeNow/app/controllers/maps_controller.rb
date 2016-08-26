class MapsController < ApplicationController

  def index
    puts "Hello World from the Index"
  end

  def show
    puts "Hello World from the Show Page"
    puts "***" *100
    p geolocation
  end

  def geolocation

    headers = {
      "key" => ENV['GEO_API_KEY']
    }

    geo_response = HTTParty.post(
      "https://www.googleapis.com/geolocation/v1/geolocate",
      headers: headers)
    geo_response
    
  end

  def places
    @lat = geolocation
    # @long = geolocation['location']['long']
    p @lat
    p @long
  end

  def directions
    @lat = geo_response['location']['lat']
    @long = geo_response['location']['long']
  end

end
