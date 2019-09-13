require_relative( 'models/Customer.rb' )
require_relative( 'models/Film.rb' )
require_relative( 'models/Ticket.rb' )
Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

require( 'pry-byebug' )
customer1 = Customer.new({'name' => 'Sree' ,'funds' => 20000 })
customer1.save()
customer2= Customer.new({'name' => 'Nandini' ,'funds' => 50000})
customer2.save()




film1 = Film.new({'title' => 'LA LA LAND' ,'price' => 20 })
film1.save()
film2 = Film.new({'title' => 'HARRY PORTOR' ,'price' => 30 })
film2.save()



ticket1 = Ticket.new({'customer_id' => customer2.id , 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id , 'film_id' => film2.id})
ticket2.save()

binding.pry
nil
