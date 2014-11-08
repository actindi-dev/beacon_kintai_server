# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
users_hash = [
  { name: 'さかと', email: 'sakato@sakato.com' },
  { name: 'オクトキャット', email: 'okuto@kyatto.com' }
]

users_hash.each { |x|
  User.create! do |user|
    user.name = x[:name]
    user.email = x[:email]
  end
}

puts 'finished!'
