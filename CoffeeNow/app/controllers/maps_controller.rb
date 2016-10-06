class MapsController < ApplicationController

  def index
    puts "Hello World from the Index"
  end

  def show
    @lat = geolocation['location']['lat']
    @long = geolocation['location']['lng']
    p "*" * 200
    p @lat
    p @long
    @fearless_lat = "37.785205"
    @fearless_long = "-122.395468"
    @place_id = places['id']
    @place_name = places['name']
    @place_lat = places['geometry']['location']['lat']
    @place_long = places['geometry']['location']['lng']
    p "%" * 200
    puts places
    puts @place_lat
  end

#this is making a call to get the location of the user
  def geolocation
    p "$" * 100
    response = HTTParty.post("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GEO_API_KEY']}")
  end

# get the place ID of the nearest open coffee shop to current location
  def places
    @lat = geolocation['location']['lat']
    @long = geolocation['location']['lng']
    response = HTTParty.post("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@lat},#{@long}&radius=500&type=cafe&key=#{ENV['PLACES_API_KEY']}")
    return response['results'][1]
  end

  def directions
    @place_id = places
  end

end
