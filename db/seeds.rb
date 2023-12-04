# db/seeds.rb

# Create users
users_data = [
  { email: 'abaldwin1@colgate.edu', password: 'password123' },
  { email: 'ccmaylo@colgate.edu', password: 'password456' },
  { email: 'rdelpriore@colgate.edu', password: 'password789' }
]

# Bulk insert users
users = User.create!(users_data)

# Define product data (adjust this with your product details)
products_data = [
  {
    description: 'Black winter hat',
    size: 'M',
    condition: 'New',
    brand: 'Aritzia',
    price: 40.00,
    original_price: 59.00,
    user_id: users.first.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'black_aritiz_hat.webp'))
  },
  {
    description: 'Black jeans',
    size: 'S',
    condition: 'Used',
    brand: 'Reformation',
    price: 100.00,
    original_price: 170.00,
    user_id: users.second.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'black_jeans_ref.jpg'))
  },
  {
    description: 'Black Super Puff Coat',
    size: 'L',
    condition: 'Barely Used',
    brand: 'Aritzia',
    price: 125.00,
    original_price: 175.00,
    user_id: users.third.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'black_superpuff_L.jpg'))
  },
  {
    description: 'Black sweatpants',
    size: 'L',
    condition: 'Used',
    brand: 'Aritzia',
    price: 98.00,
    original_price: 145.00,
    user_id: users.first.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'black_sweatpants_L.webp'))
  }, 
  {
    description: 'reformation blue jeans',
    size: 'S',
    condition: 'New',
    brand: 'Reformation',
    price: 179.00,
    original_price: 210.00,
    user_id: users.second.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'blue_jeans.jpg'))
  },
  {
    description: 'Sparkly jeans',
    size: 'M',
    condition: 'Used',
    brand: 'Reformation',
    price: 210.00,
    original_price: 230.00,
    user_id: users.third.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'blue_sparkle_jeans_ref.jpg'))
  },
  {
    description: 'Reformation brown sweater',
    size: 'S',
    condition: 'New',
    brand: 'Reformation',
    price: 87.00,
    original_price: 99.00,
    user_id: users.first.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'brown_sweater_ref.webp'))
  },
  {
    description: 'Dark blue jeans',
    size: 'M',
    condition: 'Barely Used',
    brand: 'Reformation',
    price: 149.99,
    original_price: 174.99,
    user_id: users.second.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'dark_jeans_ref.jpg'))
  },
  {
    description: 'Full Lululemon Scuba outfit',
    size: 'L',
    condition: 'New',
    brand: 'Lululemon',
    price: 189.99,
    original_price: 299.99,
    user_id: users.third.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'full_tan_scuba.webp'))
  },
  {
    description: 'Grey Super Puff vest',
    size: 'M',
    condition: 'Barley Used',
    brand: 'Aritzia',
    price: 127.00,
    original_price: 169.99,
    user_id: users.first.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'grey_vest_aritizia_L.webp'))
  },
  {
    description: 'Light brown sweater',
    size: 'L',
    condition: 'Used',
    brand: 'Reformation',
    price: 75.00,
    original_price: 194.99,
    user_id: users.second.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'light_brown_sweater.webp'))
  },
  {
    description: 'Pink Lululemon shorts',
    size: 'M',
    condition: 'New',
    brand: 'Lululemon',
    price: 70.00,
    original_price: 79.99,
    user_id: users.first.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'pink_lulu_shorts.webp'))
  },
  {
    description: 'Pink sweatshirt',
    size: 'M',
    condition: 'Poor',
    brand: 'Lululemon',
    price: 60.00,
    original_price: 74.99,
    user_id: users.third.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'pink_sweatshirt_M.webp'))
  },
  {
    description: 'Purple lululemon leggings',
    size: 'S',
    condition: 'New',
    brand: 'Lululemon',
    price: 40.00,
    original_price: 89.99,
    user_id: users.second.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'purple_lulu_legs.webp'))
  },
  {
    description: 'Tan Scuba shirt',
    size: 'L',
    condition: 'Poor',
    brand: 'Lululemon',
    price: 30.00,
    original_price: 94.99,
    user_id: users.third.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'tan_scuba.webp'))
  },
  {
    description: 'Tan Yankees Hat',
    size: 'S',
    condition: 'New',
    brand: 'Alo',
    price: 30.00,
    original_price: 50.00,
    user_id: users.first.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'tan_yankees_hat_M.jpg'))
  },
  {
    description: 'White sneakers',
    size: 'S',
    condition: 'Barely Used',
    brand: 'Alo',
    price: 160.00,
    original_price: 189.99,
    user_id: users.second.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'white_alo_sneakers_L.webp'))
  },
  {
    description: 'White skirt',
    size: 'S',
    condition: 'New',
    brand: 'Alo',
    price: 40.00,
    original_price: 64.99,
    user_id: users.third.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'white_skirt_S.webp'))
  },
  {
    description: 'Workout Set',
    size: 'L',
    condition: 'Poor',
    brand: 'Aritzia',
    price: 60.00,
    original_price: 180.00,
    user_id: users.first.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'workout_set_aritz_S.webp'))
  },
  {
    description: 'Yellow shirt',
    size: 'L',
    condition: 'Poor',
    brand: 'Lululemon',
    price: 20.00,
    original_price: 39.99,
    user_id: users.third.id,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'yellow_shirt_s.webp'))
  } 
]
products_data.each do |product_data|
  sleep(1)
  file_path = product_data[:photo]
  photo = File.open(Rails.root.join(file_path))

  filename = File.basename(file_path)
  # Extracting filename without extension for use in attachment
  filename_without_extension = File.basename(file_path, '.*')

  product = Product.new(product_data.except(:photo))
  product.photo.attach(io: photo, filename: "#{filename_without_extension}.#{photo.path.split('.').last}", content_type: 'image/jpeg')
  product.save!
end