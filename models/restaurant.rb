require_relative('../db/sql_runner')

class Restaurant

  attr_reader( :name, :address, :id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
  end
  
end