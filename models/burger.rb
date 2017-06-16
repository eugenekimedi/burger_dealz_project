require_relative('../db/sql_runner')

class Burger

  attr_reader( :name, :restaurant_id, :id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @restaurant_id = options['restaurant_id']
  end

  def save()
    sql = "INSERT INTO burgers (
      name, restaurant_id
    ) VALUES (
      '#{@name}', '#{@restaurant_id}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM burgers"
    results = SqlRunner.run(sql)
    return results { |hash| Burger.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM burgers"
    SqlRunner.run(sql)
  end
end