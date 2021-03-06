# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails db:seed
FactoryBot.create_list(:user, 10)

FactoryBot.create_list(:comment, 10)

FactoryBot.create_list(:event, 10)

FactoryBot.create_list(:report, 10)
