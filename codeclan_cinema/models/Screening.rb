require_relative("../db/sql_runner")

class Screening
  attr_accessor :screening_time ,:id

  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @screening_time=options['screening_time']
  end
  def save()
    sql ="INSERT INTO screenings (screening_time)VALUES($1) RETURNING id"
    values =[@screening_time]
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
