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
  
end