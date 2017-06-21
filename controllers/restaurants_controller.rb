require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/restaurant.rb')

get '/restaurants' do
  @restaurants = Restaurant.all()
  erb ( :"restaurants/index")
end

post '/restaurants/:id' do
  restaurant = Restarurant.new(params)
  restaurant.update
  redirect to "/restaurants/#{params['id']}"
end
