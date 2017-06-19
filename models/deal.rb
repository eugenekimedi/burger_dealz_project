require_relative('../db/sql_runner')

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

  def restaurant()
    sql = "SELECT DISTINCT restaurants.* FROM restuarants
    INNER JOIN burgers
    ON restaurants.id = burgers.restaurant_id
    INNER JOIN burger_deals
    ON burger_deals.burger_id = burgers.id
    where burger_deals.deal_id = #{@id}"
    restaurants_hashes = SqlRunner.run(sql)
    result = restaurants_hashes.map {|restaurant_hash| Restaurant.new(restaurant_hash)}
    return result
  end
  def self.all()
    sql = "SELECT * FROM deals"
    results = SqlRunner.run(sql)
    return results { |hash| Deal.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM deals"
    SqlRunner.run(sql)
  end
end