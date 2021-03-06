# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Venue.destroy_all
User.destroy_all


puts "Creating Users"
User.create(name:"Aren", password:"123456", email:"aren@gmail.com")
hayden = User.create(name:"Hayden", password:"123456", email:"hayden@gmail.com")
User.create(name:"Michael", password:"123456", email:"michael@gmail.com")
aren = User.create(name:"Lea", password:"123456", email:"lea@gmail.com")

User.all.each { |use| puts use.name }
puts "---------"

puts "Creating Venues"
puts "---------"
espy = Venue.create(name:"Espy",description:"This is an amazing venue for live rock music.",location:"11 The Esplanade, St Kilda VIC 3182", price_per_hour: 500, room_size:"Large", user_id: aren.id, picture_url:"https://cdn.concreteplayground.com/content/uploads/2018/11/esplanade-hotel-espy-st-kilda-supplied-alex-drewnik-exterior.jpeg")
Venue.create(name:"Northcote Social Club",description:"One of the best live music venues in Melbourne.",location:"301 High St, Northcote VIC 3070", price_per_hour: 300, room_size:"Medium", user_id: aren.id, picture_url:"https://beat.com.au/wp-content/uploads/2019/04/NSC-Bandroom.jpg")
forum = Venue.create(name:"The Forum",description:"Long-running, buzzing bar with outdoor seats, for free live music downstairs and big names upstairs.",location:"29 Fitzroy St, St Kilda VIC 3182", price_per_hour: 800, room_size:"Extra-Large", user_id: hayden.id, picture_url:"https://marrinergroup.com.au/uploads/Image-46-1533083252.jpg")
Venue.create(name:"Brunswick Ballroom",description:"This is a suburb gem!",location:"314 Sydney Rd, Brunswick VIC 3056", price_per_hour: 300, room_size:"Medium", user_id: hayden.id, picture_url:"https://brunswickballroom.com.au/wp-content/uploads/2021/03/0S4A6489.jpg")
Venue.create(name:"Cherry Bar",description:"Iconic, raucous bar featuring a lineup of local & international rock 'n' roll acts.",location:"68 Little Collins St, Melbourne VIC 3000", price_per_hour: 200, room_size:"Small", user_id: hayden.id, picture_url:"https://themusicnetwork.com/wp-content/uploads/Cherrry-Bar.jpg")
Venue.create(name:"Corner Hotel",description:"Popular landmark for local & international music acts, with a rooftop bar & pub grub menu.",location:"57 Swan St, Richmond VIC 3121", price_per_hour: 600, room_size:"Large", user_id: hayden.id, picture_url:"https://www.visitvictoria.com/-/media/images/melbourne/things-to-do/entertainment/live-music/the-corner-hotel_mel_r_1409926_1150x863.jpg?ts=20171122170257")
Venue.create(name:"The Tote",description:"Long-running, iconic locale with exposed-brick walls, for punk, metal, and psychedelic rock bands.",location:"67-71 Johnston St, Collingwood VIC 3066", price_per_hour: 300, room_size:"Medium", user_id: hayden.id, picture_url:"https://www.partystar.com.au/images/venue/745-2.jpg")
Venue.create(name:"Sidney Myer Music Bowl",description:"The Sidney Myer Music Bowl is an outdoor bandshell performance venue in Melbourne, Victoria, Australia.",location:"Kings Domain Gardens, Linlithgow Ave, Melbourne VIC 3000", price_per_hour: 1500, room_size:"Extra-Large", user_id: aren.id, picture_url:"https://media.timeout.com/images/105590507/image.jpg")

Venue.all.each { |ven| puts ven.name}
puts "---------"
puts "Creating Bookings"
# Booking.create(start_time:'2022-06-22 12:00:00', end_time:'2022-06-22 13:00:00', total_price: 200, status: 1, venue_id: espy.id, user_id: aren.id)
# Booking.create(start_time:'2022-06-24 13:00:00', end_time:'2022-06-24 14:00:00', total_price: 200, status: 1, venue_id: forum.id, user_id: hayden.id)
puts "---------"
# Booking.all.each { |book| p book }
