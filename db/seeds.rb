User.delete_all

5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: "azerty"
  )
  user.save
  puts "user #{user.id} created"
end

User.create(first_name: "Fli",
  last_name: "bustier",
  email: "flibustier@yopmail.com",
  password: "azerty"
)
puts "Flibustier created"
