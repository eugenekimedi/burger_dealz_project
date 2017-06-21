require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/restaurant.rb')

#index
get '/restaurants' do
  @restaurants = Restaurant.all()
  erb ( :"restaurants/index")
end

#new
get '/restaurants/new' do
  erb(:"restaurants/new")
end

#create
post '/restaurants' do
  Restaurant.new(params).save
  redirect to '/restaurants'
end



