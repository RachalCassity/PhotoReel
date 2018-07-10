# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "rachal@example.com",
  username: "rachal",
  password: "password"
)

User.create!(
  email: "zacc@example.com",
  username: "zacc",
  password: "password"
)

10.times do
  username = SecureRandom.hex 
  User.create!(
    email: "#{username}@example.com",
    username: username,
    password: "password"
  )
end

User.all.each do |user|
  %w[ruby rails].each do |photo_name|
    Photo.create!(
      description: photo_name,
      image: File.open(File.join(Rails.root, "test", "fixtures", "files", "#{photo_name}.png")),
      user: user
    )
  end
end
