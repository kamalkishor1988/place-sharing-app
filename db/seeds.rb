# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy Records
User.destroy_all

# Seed User
user1 = User.create!(email: 'user1@example.com', password: 'user1@123', password_confirmation: 'user1@123')
user2 = User.create!(email: 'user2@example.com', password: 'user2@123', password_confirmation: 'user2@123')
user3 = User.create!(email: 'user3@example.com', password: 'user3@123', password_confirmation: 'user3@123')
user4 = User.create!(email: 'user4@example.com', password: 'user4@123', password_confirmation: 'user4@123')
user5 = User.create!(email: 'user5@example.com', password: 'user5@123', password_confirmation: 'user5@123')
user6 = User.create!(email: 'user6@example.com', password: 'user6@123', password_confirmation: 'user6@123')
user7 = User.create!(email: 'user7@example.com', password: 'user7@123', password_confirmation: 'user7@123')
user8 = User.create!(email: 'user8@example.com', password: 'user8@123', password_confirmation: 'user8@123')
user9 = User.create!(email: 'user9@example.com', password: 'user9@123', password_confirmation: 'user9@123')
user10 = User.create!(email: 'user10@example.com', password: 'user10@123', password_confirmation: 'user10@123')
user11 = User.create!(email: 'user11@example.com', password: 'user11@123', password_confirmation: 'user11@123')
user12 = User.create!(email: 'user12@example.com', password: 'user12@123', password_confirmation: 'user12@123')
user13 = User.create!(email: 'user13@example.com', password: 'user13@123', password_confirmation: 'user13@123')
user14 = User.create!(email: 'user14@example.com', password: 'user14@123', password_confirmation: 'user14@123')
user15 = User.create!(email: 'user15@example.com', password: 'user15@123', password_confirmation: 'user15@123')

# Seed places shared by user
user1.places.create(
	title: 'First Share',
	address: 'MG Road, Chennai, Tamilnadu, India',
	shared_ids: [user2.id, user3.id]
)
user1.places.create(
	title: 'First Public Share',
	address: 'Juhu, Mumbai, Maharastra, India',
	public: true
)
user1.places.create(
	title: 'Second Public Share',
	address: 'MG Road, Bengaluru, Karnataka, India',
	public: true
)
user1.places.create(
	title: 'Third Public Share',
	address: 'Connaught Place, Delhi, Delhi, India',
	public: true
)
user1.places.create(
	title: 'Second Share',
	address: 'New York City',
	shared_ids: [user4.id, user5.id]
)
user2.places.create(
	title: 'User2 Share',
	address: 'Westminster, London SW1A 0AA, UK',
	shared_ids: [user1.id, user3.id]
)
user2.places.create(
	title: 'User2 Public Share',
	address: 'The Dubai Mall, Dubai, United Arab Emirates',
	public: true
)