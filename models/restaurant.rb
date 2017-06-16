require_relative('../db/sql_runner')

class Restaurant

  attr_reader( :name, :address, :id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
  end

  def save()
    sql = "INSERT INTO restaurants (
      name, address
    ) VALUES (
      '#{@name}', '#{@address}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM restaurants"
    results = SqlRunner.run(sql)
    return results { |hash| Restaurant.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM restaurants"
    SqlRunner.run(sql)
  end
  
end