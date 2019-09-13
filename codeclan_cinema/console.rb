require_relative( 'models/Customer.rb' )
require_relative( 'models/Film.rb' )
require_relative( 'models/Screening.rb' )
require_relative( 'models/Ticket.rb' )

Customer.delete_all()
Film.delete_all()
Screening.delete_all()
Ticket.delete_all()


require( 'pry-byebug' )
customer1 = Customer.new({'name' => 'Sree' ,'funds' => 20000 })
customer1.save()
customer2= Customer.new({'name' => 'Nandini' ,'funds' => 50000})
customer2.save()
customer3= Customer.new({'name' => 'Uday' ,'funds' => 70000})
customer3.save()




film1 = Film.new({'title' => 'LA LA LAND' ,'price' => 20 })
film1.save()
film2 = Film.new({'title' => 'HARRY PORTOR' ,'price' => 30 })
film2.save()

screening1=Screening.new({'screening_time' => '15:30','seats_availability'=> 4})
screening1.save()
screening2=Screening.new({'screening_time' => '10:30','seats_availability'=>3})
screening2.save()
screening3=Screening.new({'screening_time' => '20:30','seats_availability'=>5})
screening3.save()




ticket1 = Ticket.new({'customer_id' => customer2.id , 'film_id' => film1.id,'screening_id'=> screening1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id , 'film_id' => film2.id,'screening_id'=> screening3.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer1.id , 'film_id' => film2.id,'screening_id'=> screening2.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer3.id , 'film_id' => film2.id,'screening_id'=> screening2.id})
ticket4.save()

binding.pry
nil
