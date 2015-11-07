password = '12345678'

User.create!(name:'Administrator', email:'admin@test.com',
             password: password, password_confirmation: password, admin: true )

users = []
5.times do
  user = User.new
  user.name = Faker::Name.name
  user.email = Faker::Internet.email(user.name)
  user.password = password
  user.password_confirmation = password
  user.save
  users.push user
end

10.times do
  photo = Photo.new
  photo.title = Faker::Address.country
  photo.user = users.sample
  photo.image = File.open(File.join(Rails.root, "/app/assets/images/fixtures/#{rand(1..8)}.jpg"))
  photo.save
end