require "minitest/autorun"
require "minitest/rg"
require_relative "../models/burger"
require_relative "../models/restaurant"

# class TestBurger < MiniTest::Test
#   def setup
#     @burger  = Burger.new({
#   'name' => 'Signature Bob',
#   'restaurant_id' => @restaurant.id
#   })

#     @restaurant = Restaurant.new({
#       'name' => 'Bobs Burgers',
#       'address' => '1 Bob Street'
#     })
#   end

#   def test_name
#     assert_equal('Signature Bob', burger1.name )
#   end
# end