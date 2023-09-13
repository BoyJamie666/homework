class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end
      self.game_over_message
      self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !@game_over
      self.round_success_message
    end

    @sequence_length += 1
  end

  def show_sequence
    self.add_random_color
  end

  def require_sequence
    puts "Repeat the sequence by entering the first letter of each color on a new line."
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
   @seq << COLORS.shuffle[0]
  end

  def round_success_message
    "Round successful. Here's the next sequence:"
  end

  def game_over_message
     puts "Game over! You made it #{@sequence_length - 1} rounds."
  end

  def reset_game
    self.initialize
  end
end