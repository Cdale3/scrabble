require './lib/scrabble'
class GameReader
  attr_reader :scrabble_word

  def initialize(scrabble_word)
    @scrabble_word = scrabble_word.upcase.split("")
    @word_score = Scrabble.new.point_values
  end

  def score_with_multipliers(word, array)
     score = @word_score
    score.each do |letter, scrabble_word| puts scrabble_word
    end
    # p word
    # p array
  end
end


#
# game = Scrabble.new
# game.score_with_multipliers('hello', [1,2,1,1,1])  # => 9
