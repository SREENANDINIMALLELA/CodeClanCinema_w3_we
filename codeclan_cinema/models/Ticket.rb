require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id ,:screening_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id= options['film_id'].to_i
    @screening_id= options['screening_id'].to_i

  end
  def save()
    sql ="INSERT INTO tickets (customer_id,film_id,screening_id)VALUES($1,$2,$3) RETURNING id"
    values =[@customer_id , @film_id,@screening_id]
  ticket=SqlRunner.run(sql,values).first
  @id= ticket['id'].to_i
  end
  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run(sql, values)
    result = tickets.map { |ticket| Ticket.new(ticket ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end
end
