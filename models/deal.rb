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

  def self.all()
    sql = "SELECT * FROM deals"
    results = SqlRunner.run(sql)
    return results { |hash| Deal.new(hash)}
  end
end