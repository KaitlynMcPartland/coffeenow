class MapsController < ApplicationController

  def index
    puts "Hello World from the Index"
  end

  def show
    @lat = geolocation['location']['lat']
    @long = geolocation['location']['lng']
    @fearless_lat = "37.785205"
    @fearless_long = "-122.395468"
    @place_id = places
  end

  def geolocation
    response = HTTParty.post("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GEO_API_KEY']}")
  end

  def places
    @lat = geolocation['location']['lat']
    @long = geolocation['location']['lng']
    response = HTTParty.post("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@lat},#{@long}&radius=500&type=cafe&key=#{ENV['PLACES_API_KEY']}")
    return response['results'][1]['id']
  end

  def directions
    @place_id = places
  end

end
