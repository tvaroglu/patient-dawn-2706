# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CompetitionTeam.destroy_all
Player.destroy_all
Team.destroy_all
Competition.destroy_all

# Teams
team_1 = Team.create!(hometown: 'Boulder', nickname: 'Buffs')
team_2 = Team.create!(hometown: 'Fort Collins', nickname: 'Rams')
team_3 = Team.create!(hometown: 'Greeley', nickname: 'Bears')

# Players
player_1 = team_1.players.create!(name: 'Player 1', age: 20)
player_2 = team_1.players.create!(name: 'Player 2', age: 19)
player_3 = team_2.players.create!(name: 'Player 3', age: 21)
player_4 = team_2.players.create!(name: 'Player 4', age: 22)
player_5 = team_3.players.create!(name: 'Player 5', age: 18)
player_6 = team_3.players.create!(name: 'Player 6', age: 23)

# Competitions
competition_1 = Competition.create!(name: 'PAC12 Championship', location: 'Denver', sport: 'football')
