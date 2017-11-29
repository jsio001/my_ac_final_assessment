# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless Note.count > 10
  Note.create(title: "Note No."+ Faker::Number.between(1, 10).to_s, body: Faker::Hipster.paragraph(2, false, 4))
end
