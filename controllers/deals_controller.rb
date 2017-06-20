require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/deal.rb')

get '/deals' do
  @deals = Deal.all()
  erb ( :"deals/index")
end

get '/deals/new' do
  @days= Day.all()
  @burgers= Burger.all()
  erb (:"deals/new")
end

post '/deals' do
  Deal.new(params).save
  redirect to '/deals'
end