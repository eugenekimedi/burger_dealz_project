require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/burger.rb')
require_relative('../models/restaurant.rb')

get '/burgers' do
  @burgers = Burger.all()
  erb ( :"burgers/index")
end

get '/burgers/new' do
  @restaurants =  Restaurant.all()
  erb (:"burgers/new")
end