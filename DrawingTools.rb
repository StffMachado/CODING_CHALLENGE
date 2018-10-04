require './UserInput'
require './Painter'

class DrawingTools


   def initialize
     $canvas
   end

  def run
    puts 'Enter command'
    @command = gets.chomp.to_s
    user = UserInput.new
    user.read(@command)
  end

  def command_validated(d)


    if d[0] == 'C'
      canvas = Painter.new
      canvas.painter_canvas(d)
    elsif  d[0] == 'L'
      line = Painter.new
      line.painter_line(d)
    elsif  d[0] == 'R'
      rectangle = Painter.new
      rectangle.painter_rectangle(d)
    else
      fill = Painter.new
      fill.painter_fill(d)
    end
  end


end
