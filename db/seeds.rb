# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ranks = %w[ace two three four five six seven eight nine ten jack queen king]
suits = %w[clubs diamonds hearts spades]

ranks.each { |r| suits.each { |s| Card.create(suit: s, rank: r, suit_rank: "#{s}_#{r}") } }