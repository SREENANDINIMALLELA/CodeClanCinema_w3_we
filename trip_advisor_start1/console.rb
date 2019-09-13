require_relative( 'models/user' )
require_relative( 'models/location' )
require_relative( 'models/visit' )

require( 'pry-byebug' )

Visit.delete_all()
Location.delete_all()
User.delete_all()

user1 = User.new({ 'name' => 'Colin Bell' })
user1.save()
user2 = User.new({ 'name' => 'Debi Skea' })
user2.save()
user3 = User.new({ 'name' => 'John McGollum' })
user3.save()

location1 = Location.new({ 'category' => 'Museums', 'name' => 'Kelvingrove Art Gallery'})
location1.save()
location2 = Location.new({ 'category' => 'Pub', 'name' => 'Howlin Wolf'})
location2.save()

visit1 = Visit.new({ 'user_id' => user1.id, 'location_id' => location1.id, 'review' => '0 stars, far too hot'})
visit1.save()
visit2 = Visit.new({ 'user_id' => user3.id, 'location_id' => location1.id, 'review' => '5 stars, would visit again if I could'})
visit2.save()
visit3 = Visit.new({ 'user_id' => user1.id, 'location_id' => location2.id, 'review' => '4 stars, plenty of beer available'})
visit3.save()
visit4 = Visit.new({ 'user_id' => user2.id, 'location_id' => location2.id, 'review' => '3 stars, too crowded'})
visit4.save()

binding.pry
nil
