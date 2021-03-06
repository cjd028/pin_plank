# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed Users


User.create(name:"Adam Warlock", email:"adamw@gmail.com", password: "123")

ActiveRecord::Base.transaction do
  10.times do |t|
    user = User.new
    user[:name] = Faker::Name.name 
    user[:email] = Faker::Internet.email
    user.save
    user.update(password: "123")
  end
end 
