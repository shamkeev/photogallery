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

photos = []
20.times do
  photo = Photo.new
  photo.title = Faker::Address.country
  photo.user = users.sample
  photo.image = File.open(File.join(Rails.root, "/app/assets/images/fixtures/#{rand(1..20)}.jpg"))
  photo.save
  photos.push photo
end

70.times do
  comment = Comment.new
  comment.text = Faker::Hacker.say_something_smart
  comment.photo = photos.sample
  comment.user = users.sample
  comment.rating = rand(1..5)
  comment.save
end