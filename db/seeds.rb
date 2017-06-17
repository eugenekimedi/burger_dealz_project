require_relative('../models/burger')
require_relative('../models/burger_deal')
require_relative('../models/day')
require_relative('../models/deal')
require_relative('../models/restaurant')
require('pry-byebug')

BurgerDeal.delete_all
Burger.delete_all
Deal.delete_all
Day.delete_all
Restaurant.delete_all

day1 = Day.new({
  'name' => 'Monday'
  })

day1.save

restaurant1 = Restaurant.new({
  'name' => 'Bobs Burgers',
  'address' => '1 Bob Street'
})

restaurant1.save

burger1 = Burger.new({
  'name' => 'Signature Bob',
  'restaurant_id' => restaurant1.id
  })

burger1.save

deal1 = Deal.new({
  'name' => 'Monday Madness',
  'day_id' => day1.id
  })

deal1.save

burger_deal1 = BurgerDeal.new({
  'burger_id' => burger1.id,
  'deal_id' => deal1.id
  })

burger_deal1.save