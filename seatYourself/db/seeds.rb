# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	Restaurant.create(
		addr: '100 Cumberland St  Toronto, ON M5R 1A6',
		close_hour: '23',
		name: 'Sassafraz', 
		open_hour: '10',
		phone: '4169642222',
		picture: 'http://www.bloor-yorkville.com/Thumbnail.ashx?i=/img/stores/images/cache/sassafraz.jpg&s=284x165',
		seats: '100'
		)

	Restaurant.create(
		addr: '20 Cumberland St., Toronto, Ontario',
		close_hour: '22',
		name: 'Rawlicious', 
		open_hour: '11',
		phone: '4166460705',
		picture: 'http://www.torontolife.com/daily/wp-content/uploads/2012/06/rawlicious-logo.jpg',
		seats: '100'
		)

