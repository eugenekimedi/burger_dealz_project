require_relative('../db/sql_runner')

class Day

  attr_reader( :id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO days (
      name
    ) VALUES (
      '#{@name}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end
end