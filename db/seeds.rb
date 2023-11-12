# db/seeds.rb

# Create users
users = [
  { email: 'abaldwin1@colgate.edu', password: 'password123' },
  { email: 'ccmaylo@colgate.edu', password: 'password456' },
  { email: 'rdelpriore@colgate.edu', password: 'password789' }
]

users.each do |user_data|
  User.create!(user_data)
end


# Create products and associate them with users
Product.create!(
  description: 'Plain white t-shirt',
  size: 'L',
  condition: 'New',
  brand: 'Target',
  price: 10.00,
  original_price: 20.00,
  user: User.find_by(email: 'abaldwin1@colgate.edu')
).photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'download-1.jpg')), filename:'download-1.jpg', content_type: 'image/jpeg')


Product.create!(
  description: 'Blue jeans',
  size: 'M',
  condition: 'Used',
  brand: 'Levi',
  price: 60.00,
  original_price: 80.00,
  user: User.find_by(email: 'abaldwin1@colgate.edu')
).photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'download-2.jpg')), filename:'download-2.jpg', content_type: 'image/jpeg')

Product.create!(
  description: 'Green sweatshirt',
  size: 'S',
  condition: 'New',
  brand: 'Arie',
  price: 25.00,
  original_price: 30.00,
  user: User.find_by(email: 'ccmaylo@colgate.edu')
).photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'download-3.jpg')), filename:'download-3.jpg', content_type: 'image/jpeg')

Product.create!(
  description: 'Dress',
  size: 'M',
  condition: 'Fairly used',
  brand: 'Goodwill',
  price: 2.00,
  original_price: 5.00,
  user: User.find_by(email: 'rdelpriore@colgate.edu')
).photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'download-4.jpg')), filename:'download-4.jpg', content_type: 'image/jpeg')
