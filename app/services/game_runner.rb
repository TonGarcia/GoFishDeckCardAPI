class GameRunnerService
  def self.setup
    players = ::Player.all.to_a
    players_names = []
    amount_players = rand(2..5)
    if players.length < amount_players
      amount_players.times do
        player_name = Faker::Name.name.split(' ')[0].downcase
        players << Player.create(name: player_name)
        players_names << player_name
      end
    else
      players = ::Player.all.limit(amount_players)
      players.each { |p| players_names << p.name }
    end

    game = Game.create
    game.players = players
    game.save

    cards = Card.all

    players.each do |player|

    end

    if players.length == 2
      # 7 cards if 2 players
    else
      # 5 cards if more players
    end

    game
  end

  def self.players_names(game)
    names = []
    game.players.each { |p| names << p.name }
    names
  end
end