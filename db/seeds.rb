# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.count > 5
  User.create(email: 'user1@mail.com', password: '123456', password_confirmation: '123456')
  User.create(email: 'user2@mail.com', password: '123456', password_confirmation: '123456')
  User.create(email: 'user3@mail.com', password: '123456', password_confirmation: '123456')
  User.create(email: 'user4@mail.com', password: '123456', password_confirmation: '123456')
  User.create(email: 'user5@mail.com', password: '123456', password_confirmation: '123456')
  p "users created"
end

unless Note.count > 40
  10.times do
    Note.create(title: "Seed No."+ Faker::Number.between(1, 10).to_s, body: Faker::Hipster.paragraph(2, false, 4), user_id: 1)
  end
  10.times do
    Note.create(title: "Seed No."+ Faker::Number.between(11, 20).to_s, body: Faker::Hipster.paragraph(2, false, 4), user_id: 2)
  end
  10.times do
    Note.create(title: "Seed No."+ Faker::Number.between(21, 30).to_s, body: Faker::Hipster.paragraph(2, false, 4), user_id: 3)
  end
  10.times do
    Note.create(title: "Seed No."+ Faker::Number.between(31, 40).to_s, body: Faker::Hipster.paragraph(2, false, 4), user_id: 4)
  end
  10.times do
    Note.create(title: "Seed No."+ Faker::Number.between(41, 50).to_s, body: Faker::Hipster.paragraph(2, false, 4), user_id: 5)
  end
  p "notes created"
end

unless Like.count > 25
  5.times do
    Like.create(note_id: Faker::Number.between(41, 50), user_id: 1)
  end
  5.times do
    Like.create(note_id: Faker::Number.between(1, 10), user_id: 2)
  end
  5.times do
    Like.create(note_id: Faker::Number.between(11, 20), user_id: 3)
  end
  5.times do
    Like.create(note_id: Faker::Number.between(21, 30), user_id: 4)
  end
  5.times do
    Like.create(note_id: Faker::Number.between(31, 40), user_id: 5)
  end

  unless Relation.count > 10
    Relation.create(subscriber_id: 1, poster_id: 2)
    Relation.create(subscriber_id: 1, poster_id: 3)
    Relation.create(subscriber_id: 1, poster_id: 4)
  end

end
