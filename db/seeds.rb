## Users
User.create!(email: "oli.diguer@foobar.com",
  first_name:  "Olivier",
  last_name: "Diguer",
  password:              "foobar",
  password_confirmation: "foobar")

10.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n+1}@foobar.com"
  password = "password"
  User.create!(first_name:  first_name,
  last_name: last_name,
  email: email,
  password:              password,
  password_confirmation: password)
end

## Foodstuff
3.times do |n|
  Foodstuff.create!(foodstuff_name:  Faker::Lorem.word.titleize, foodstuff_description: Faker::Lorem.sentences.join(' '))
end
