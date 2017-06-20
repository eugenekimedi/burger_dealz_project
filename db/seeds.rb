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
day2 = Day.new({
  'name' => 'Tuesday'
  })
day3 = Day.new({
  'name' => 'Wednesday'
  })
day4 = Day.new({
  'name' => 'Thursday'
  })
day5 = Day.new({
  'name' => 'Friday'
  })
day6 = Day.new({
  'name' => 'Saturday'
  })
day7 = Day.new({
  'name' => 'Sunday'
  })
day1.save
day2.save
day3.save
day4.save
day5.save
day6.save
day7.save

restaurant1 = Restaurant.new({
  'name' => 'Bobs Burgers',
  'address' => '1 Bob Street'
})
restaurant2 = Restaurant.new({
  'name' => 'Krusty Krab',
  'address' => '25 Bikini Bottom Blvd.'
})
restaurant3 = Restaurant.new({
  'name' => 'Good Burger',
  'address' => '19 Nickelodean St.'
})
restaurant4 = Restaurant.new({
  'name' => 'McBurgerTown',
  'address' => '12 Quahog Ln.'
})
restaurant5 = Restaurant.new({
  'name' => 'Big Belly Burger',
  'address' => '13 DC Road'
})

restaurant1.save
restaurant2.save
restaurant3.save
restaurant4.save
restaurant5.save

burger1 = Burger.new({
  'name' => 'Signature Bob',
  'restaurant_id' => restaurant1.id
  })
burger2 = Burger.new({
  'name' => 'Krabby Patty',
  'restaurant_id' => restaurant2.id
  })
burger3 = Burger.new({
  'name' => 'Good Burger',
  'restaurant_id' => restaurant3.id
  })
burger4 = Burger.new({
  'name' => 'Small Mac',
  'restaurant_id' => restaurant4.id
  })
burger5 = Burger.new({
  'name' => 'The Big Belly',
  'restaurant_id' => restaurant5.id
  })
burger6 = Burger.new({
  'name' => 'Quarter Bob',
  'restaurant_id' => restaurant1.id
  })
burger7 = Burger.new({
  'name' => 'Bikini Bottom Burger',
  'restaurant_id' => restaurant2.id
  })
burger8 = Burger.new({
  'name' => 'Great Burger',
  'restaurant_id' => restaurant3.id
  })
burger9 = Burger.new({
  'name' => 'Tiny Mac',
  'restaurant_id' => restaurant4.id
  })
burger10 = Burger.new({
  'name' => 'Huge Belly Burger',
  'restaurant_id' => restaurant5.id
  })

burger1.save
burger2.save
burger3.save
burger4.save
burger5.save
burger6.save
burger7.save
burger8.save
burger9.save
burger10.save

deal1 = Deal.new({
  'name' => 'Monday Madness',
  'day_id' => day1.id
  })
deal2 = Deal.new({
  'name' => '241 Tuesdays',
  'day_id' => day2.id
  })
deal3 = Deal.new({
  'name' => 'Wacky Wednesdays',
  'day_id' => day3.id
  })
deal4 = Deal.new({
  'name' => 'Thirsty Thursdays',
  'day_id' => day4.id
  })
deal5 = Deal.new({
  'name' => 'Free Fridays',
  'day_id' => day5.id
  })
deal6 = Deal.new({
  'name' => 'Super Sundays',
  'day_id' => day7.id
  })


deal1.save
deal2.save
deal3.save
deal4.save
deal5.save
deal6.save

burger_deal1 = BurgerDeal.new({
  'burger_id' => burger1.id,
  'deal_id' => deal1.id
  })
burger_deal2 = BurgerDeal.new({
  'burger_id' => burger2.id,
  'deal_id' => deal2.id
  })
burger_deal3 = BurgerDeal.new({
  'burger_id' => burger3.id,
  'deal_id' => deal3.id
  })
burger_deal4 = BurgerDeal.new({
  'burger_id' => burger4.id,
  'deal_id' => deal4.id
  })
burger_deal5 = BurgerDeal.new({
  'burger_id' => burger5.id,
  'deal_id' => deal5.id
  })
burger_deal6 = BurgerDeal.new({
  'burger_id' => burger6.id,
  'deal_id' => deal1.id
  })
burger_deal7 = BurgerDeal.new({
  'burger_id' => burger7.id,
  'deal_id' => deal2.id
  })
burger_deal8 = BurgerDeal.new({
  'burger_id' => burger8.id,
  'deal_id' => deal3.id
  })
burger_deal9 = BurgerDeal.new({
  'burger_id' => burger9.id,
  'deal_id' => deal5.id
  })
burger_deal10 = BurgerDeal.new({
  'burger_id' => burger10.id,
  'deal_id' => deal6.id
  })

burger_deal1.save
burger_deal2.save
burger_deal3.save
burger_deal4.save
burger_deal5.save
burger_deal6.save
burger_deal7.save
burger_deal8.save
burger_deal9.save
burger_deal10.save