require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds= options['funds']
  end
  def save()
    sql ="INSERT INTO customers (name,funds)VALUES($1,$2) RETURNING id"
    values =[@name , @funds]
  customer=SqlRunner.run(sql,values).first
  @id= customer['id'].to_i
  end
  def films()
    sql ="SELECT films.* FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = films.map{|film|Film.new(film)}
    return result
  end
  def remaining_fund()
    sql =" SELECT films.price FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id= $1;"
    values = [@id]
    remaining_fund = SqlRunner.run(sql, values)
    result = @funds-remaining_fund.map{|fund|fund['price']}[0].to_i
   return result
  end
  def tickets_bought()
    sql="SELECT COUNT(tickets.customer_id) FROM tickets WHERE customer_id = $1"
    values = [@id]
    tickets_bought= SqlRunner.run(sql, values)
    return tickets_bought.map{|bought|bought['count']}[0].to_i
  end
  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new(customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

end
