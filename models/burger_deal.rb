require_relative('../db/sql_runner')

class BurgerDeal

  attr_reader( :id, :burger_id, :deal_id)

  def initialize(options)
    @id = options['id'].to_i
    @burger_id = options['burger_id']
    @deal_id = options['deal_id']
  end

  def save()
    sql = "INSERT INTO burger_deals (
      burger_id, deal_id
    ) VALUES (
      '#{@burger_id}', '#{@deal_id}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def burger()
    sql = "SELECT * FROM burgers b
    INNER JOIN burger_deals bd
    ON bd.burger_id = b.id
    WHERE b.id = #{@burger_id}"
    results = SqlRunner.run(sql)
    return Burger.new(results.first)
  end

  def self.all()
    sql = "SELECT * FROM burger_deals"
    results = SqlRunner.run(sql)
    return results { |hash| BurgerDeal.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM burger_deals"
    SqlRunner.run(sql)
  end
  
end