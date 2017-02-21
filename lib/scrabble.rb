require './lib/game_reader'

  class Scrabble

    def score(word)
      numbers = word.chars.map do |letter| #word.chars #=> ["h", "e", "l", "l", "o"]
        point_values[letter.capitalize] #=> [4, 1, 1, 1, 1]
      end
      numbers.reduce(:+)
    end

    def score_with_multipliers(word, multiplier, word_bonus=1)
      letters = word.chars
      numbers = letters.map.with_index { |letter, index| point_values[letter.capitalize] * multipliers[index] }
      numbers.reduce(:+) * word_bonus
    end

    def highest_scoring_word(words)
      sorted_words = words.sort_by { |word| word.length }
      possibles = sorted_words.group_by { |word| score(word) }.max[1]
      return possibles.find { |w| w.length == 7 } if possibles.any? { |word| word.length == 7 }
      possibles.first
    end

    def another_highest_score(words)

    end

    def point_values
      {
        "A"=>1, "B"=>3, "C"=>3, "D"=>2,
        "E"=>1, "F"=>4, "G"=>2, "H"=>4,
        "I"=>1, "J"=>8, "K"=>5, "L"=>1,
        "M"=>3, "N"=>1, "O"=>1, "P"=>3,
        "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
        "U"=>1, "V"=>4, "W"=>4, "X"=>8,
        "Y"=>4, "Z"=>10
      }
    end
  end

game = Scrabble.new
puts game.score("hello", [2, 2, 2, 2, 2])
puts game.score("hello", [2, 2, 2, 2, 2], 2)
puts game.score("hello")
puts game.score("hello")
puts game.score("hello")
