require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/restaurant.rb')

#index
get '/restaurants' do
  @restaurants = Restaurant.all()
  erb ( :"restaurants/index")
end

#show
get '/restaurants/:id' do
  @restaurant = Restaurant.find(params['id'])
  erb(:"restaurants/show")
end
