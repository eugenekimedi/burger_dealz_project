require_relative('../models/burger')
require_relative('../models/day')
require_relative('../models/deal')
require_relative('../models/restaurant')
require('pry-byebug')

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