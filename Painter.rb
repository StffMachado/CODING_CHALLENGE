require 'matrix'


class Painter

def initialize
  $matrix

end

def painter_canvas(d)



 $matrix = Matrix.build(d[2].to_i, d[1].to_i) {
   |row, col| ' '
 }

  puts $matrix.to_a.map(&:inspect)
  drawingtools = DrawingTools.new
  drawingtools.run
end


def []=(i, j, x)
    $matrix[i][j] = x
  end

def painter_line(d)
  #if d[1] == d[3]
    i = d[2].to_i
    y1= d[4].to_i #5
    x = d[1].to_i #0
    z = 'X'


  #Modificar matrix canvas creada

   y1.times do
    $matrix[i][x]= 'X'
    i=i+1
  end
   puts $matrix1.to_a.map(&:inspect)


end

def painter_rectangle(d)
  puts ' Pintar Rectangle'
end

def painter_fill(d)
  puts ' Pintar fill'
end

end
