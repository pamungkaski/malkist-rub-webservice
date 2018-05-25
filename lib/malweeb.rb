require 'sinatra'
require 'malkist'
require 'json'

# Malweeb is a service class which will use malkist gem to hit the Google Maps Webservice APIs.
class Malweeb < Sinatra::Application
  get '/api/directions-matrix' do
    dist = Malkist.calculate_distance(%w[40.6655101,-73.89188969999998 40.6855101,-73.89188969999998 40.6255101,-73.89188969999998], %w[40.6905615,-73.9976592 40.8905615,-73.9976592 40.7905615,-73.9976592])

    if dist.empty?
      status 400
      []
    end

    status 200
    res = []

    dist.each do |distance|
      hash = {
        origin: distance.origin,
        destination: distance.destination,
        distance: distance.distance,
        duration: distance.duration
      }
      res.push(hash)
    end

    res.to_json
  end
end
