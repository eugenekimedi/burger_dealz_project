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
end