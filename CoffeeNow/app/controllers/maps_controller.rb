class MapsController < ApplicationController

  def index
    puts "Hello World from the Index"
  end

  def show
    current_location = geolocation['location']
    @lat = current_location['lat']
    @lng = current_location['lng']
    closest_place = places(@lat, @lng)
    @place_name = closest_place['name']
    @place_lat = closest_place['geometry']['location']['lat']
    @place_lng = closest_place['geometry']['location']['lng']
  end

#this is making a call to get the location of the user
  def geolocation
    response = HTTParty.post("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GEO_API_KEY']}")
  end

# get the place object of the nearest open coffee shop to current location
  def places(lat, lng)
    response = HTTParty.post("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=500&type=cafe&key=#{ENV['PLACES_API_KEY']}")
    return response['results'][1]
  end


end
