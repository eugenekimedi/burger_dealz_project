require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/deal.rb')

get '/deals' do
  @deals = Deal.all()
  erb ( :"deals/index")
end

get '/deals/new' do
  erb (:"deals/new")
end