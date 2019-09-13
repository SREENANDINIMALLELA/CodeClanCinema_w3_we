require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price= options['price'].to_i
  end
  def save()
    sql ="INSERT INTO films (title,price)VALUES($1,$2) RETURNING id"
    values =[@title , @price]
  film=SqlRunner.run(sql,values).first
  @id= film['id'].to_i
  end
  def customers ()
  sql ="SELECT customers.* FROM customers
  INNER JOIN tickets
  ON customers.id = tickets.customer_id WHERE film_id = $1"
  values =[@id]
  customers = SqlRunner.run(sql, values)
  result = customers.map { |customer|Customer.new( customer ) }
  return result
  end
  def customers_for_film()
    sql ="SELECT COUNT(tickets.customer_id)FROM tickets WHERE  film_id = $1"
    values =[@id]
   customers_for_film = SqlRunner.run(sql, values)
   customers_for_film.map{|customer|customer['count']}[0].to_i
  end
  def busy_screening_hours()
    sql ="select count(tickets.film_id)AS film , screenings.screening_time from tickets inner join screenings on tickets.screening_id = screenings.id where tickets.film_id = $1 group by screenings.screening_time order by count DESC limit 1;"
    values= [@id]
  busy_screening_hours = SqlRunner.run(sql, values)
  return busy_screening_hours.map{|busy_hours|busy_hours['screening_time']}[0]

  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map { |film| Film.new(film ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end
end
