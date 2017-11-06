class Board
  attr_reader :grid

  def initialize(rowNum = 6, colNum = 7)
    @grid = []
    rowNum.times do
      @grid << Array.new(colNum)
    end
    @grid << ["A", "B", "C", "D", "E", "F", "G"]
  end

  def display
    result = ""
    @grid.reverse_each { |row| result += "#{row}\n" }
    return result
  end

  def move(player, column)
    @grid.each do |row|
      unless row[column]
        row[column] = player.character
        return
      end
    end
  end

  def win_check?(player)
    @grid.each do |row|

    end
  end
end
