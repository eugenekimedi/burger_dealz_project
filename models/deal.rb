require_relative('../db/sql_runner')
require_relative('restaurant.rb')

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

  def burger()
    sql = "SELECT DISTINCT * FROM burgers
    INNER JOIN burger_deals
    ON burger_deals.burger_id = burgers.id
    where burger_deals.deal_id = #{@id}"
    burger_hash = SqlRunner.run(sql).first
    result = Burger.new(burger_hash)
    return result
  end

  def restaurant()
    sql = "SELECT DISTINCT restaurants.* FROM restaurants
    INNER JOIN burgers
    ON restaurants.id = burgers.restaurant_id
    INNER JOIN burger_deals
    ON burger_deals.burger_id = burgers.id
    where burger_deals.deal_id = #{@id}"
    restaurant_hash = SqlRunner.run(sql).first
    result = Restaurant.new(restaurant_hash)
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