require_relative('../db/sql_runner')
require_relative('restaurant.rb')
require_relative('day.rb')
require('pry-byebug')

class Deal

  attr_reader( :name, :day_id, :id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @day_id = options['day_id']
  end

  def save()
    sql = "INSERT INTO deals (
      name, day_id
    ) VALUES (
      '#{@name}', '#{@day_id}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def day()
    sql = "SELECT DISTINCT * FROM days
    WHERE id = #{@day_id}"
    day_hash = SqlRunner.run(sql).first
    result = Day.new(day_hash)
    return result
  end

  def burgers()
    sql = "SELECT DISTINCT * FROM burgers
    INNER JOIN burger_deals
    ON burger_deals.burger_id = burgers.id
    WHERE burger_deals.deal_id = #{@id}"
    burger_hash = SqlRunner.run(sql)
    result = burger_hash.map{|burger| Burger.new(burger) }
    return result
  end

  def restaurants()
    sql = "SELECT restaurants.* FROM restaurants
    INNER JOIN burgers
    ON restaurants.id = burgers.restaurant_id
    INNER JOIN burger_deals
    ON burger_deals.burger_id = burgers.id
    where burger_deals.deal_id = #{@id}"
    restaurant_hash = SqlRunner.run(sql)
    result = restaurant_hash.map{|restaurant| Restaurant.new(restaurant)}
    return result
  end

  def self.all()
    sql = "SELECT * FROM deals"
    results = SqlRunner.run(sql)
    # binding.pry
    return results.map { |hash| Deal.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM deals"
    SqlRunner.run(sql)
  end
end