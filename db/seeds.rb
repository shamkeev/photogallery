password = '12345678'

User.create!(name:'Administrator', email:'admin@test.com',
             password: password, password_confirmation: password, admin: true )


5.times do
  user = User.new
  user.name = Faker::Name.name
  user.email = Faker::Internet.email(user.name)
  user.password = password
  user.password_confirmation = password
  user.save
end