require './lib/scrabble'
class GameReader

  def initialize(file)
    @player_data = parse_data(file)
  end

  def parse_data(file)
    players_hash = {player_1: [], player_2: [] }
    CSV.foreach(file, headers: true) do |row|
      players_hash["player_#{row["player_id"]}".to_sym] << row["word"]
    end
  players_hash
  end
end
