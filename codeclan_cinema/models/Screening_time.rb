require_relative("../db/sql_runner")

class Screenings

  attr_reader :id
  attr_accessor :time ,:seat_count

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @seat_capacity = options['seat_capacity']
    @seat_capacity=options['seat_capacity']
  end
  def save()
    sql ="INSERT INTO screenings (time,seat_capacity)VALUES($1,$2) RETURNING id"
    values =[@time,@seat_capacity]
  screening_time=SqlRunner.run(sql,values).first
  @id= screening_time['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    values = []
    screenings = SqlRunner.run(sql, values)
    result = screenings.map { |screening| Screenings.new(screening) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    values = []
    SqlRunner.run(sql, values)
  end
end
