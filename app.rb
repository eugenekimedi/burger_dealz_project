require ('sinatra')
require ('sinatra/contrib/all')
require_relative('controllers/burgers_controller')
require_relative('controllers/restaurants_controller')
require_relative('controllers/deals_controller')

get '/' do
  erb (:index)
end

