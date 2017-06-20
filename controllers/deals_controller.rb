require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/deal.rb')
require_relative('../models/burger_deal.rb')

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
  deal=Deal.new(params).save
  params['deal_id'] = deal
  BurgerDeal.new(params).save
  redirect to '/deals'
end
# have to put a BurgerDeal.new with the id of Deal as the params