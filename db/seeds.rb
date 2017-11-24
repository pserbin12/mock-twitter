# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
email = "ptserbin.10@gmail.com"
@user = User.create!(
  name: "Paige Serbin",
  username: 'pserbin12',
  email: email,
  city: "Columbus",
  state: "Ohio",
  password: '123456',
  password_confirmation: '123456'
)

@user.avatar = Rails.root.join("app/assets/images/profile-pic.jpg").open

10.times do
  @user.toots.create(
    message: Faker::Lorem.paragraph,
    created_at: Faker::Time.between(25.days.ago, Time.now, :all)
  )
end
  @user.save!

puts "Generating Users"

20.times do |i|
  putc "."
  password = Faker::Internet.password(6)

  u = User.create!(
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    city: Faker::Address.city,
    state: Faker::Address.state,
    password: password,
    password_confirmation: password
  )

  u.avatar = Rails.root.join("app/assets/images/stock-profile-#{i + 1}.jpeg").open

  10.times do
    u.toots.create(
      message: Faker::Lorem.paragraph,
      created_at: Faker::Time.between(25.days.ago, Time.now, :all)
    )
  end
  u.save!
end

7.times do
  u = User.all.sample
  unless u.id == @user.id
    puts "Following @#{u.username}"
    @user.following.push(u.id.to_s)
  end
end

@user.save!
