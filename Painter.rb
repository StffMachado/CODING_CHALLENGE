
class Painter

def initialize
#@drawingtools = DrawingTools.new
end

  def command_validated(d)

    if d[0] == 'C'
      painter_canvas(d)
    elsif  d[0] == 'L'
      painter_line(d)
    elsif  d[0] == 'R'
      painter_rectangle(d)
    else
      painter_fill(d)
    end
  end


def painter_canvas(d)
  # create
 @canvas = []
  heigh = d[1].to_i+2

  for i in (0..d[2].to_i+1)
    @canvas.push([' ']*heigh)
  end

 #delimitar

  for k in (0..@canvas.size-1)
    for l in (0..@canvas[k].size-1)
      @hor = @canvas.size-1
      @vert = @canvas[k].size-1
      if k == 0
         @canvas[k][l] = '-'
       end
       if k == @hor
           @canvas[k][l] = '-'
       end
      if l == 0 && @canvas[k][l] == '-'
         @canvas[k][l] = '|'
       end
      if l == 0
          @canvas[k][l] = '|'
      end
      if l == @vert
          @canvas[k][l] = '|'
      end

    end
  end


  #imprimir
  imprimir

end

def imprimir
  for m in(0..@canvas.size-1)
    for n in (0..@canvas[m].size-1)
    print "#{@canvas[m][n]}\s"
    end
    print "\n"
  end


end

def painter_line(d)
 x_cero = d[1].to_i
 y_cero = d[2].to_i
 x_uno = d[3].to_i
 y_uno = d[4].to_i
  if x_cero < @vert &&  y_cero < @hor && x_uno < @vert && y_uno < @hor

    if x_cero == x_uno
      for i in(y_cero..y_uno)
        @canvas[i][x_cero]="X"
      end

      imprimir
    end

    if y_cero == y_uno
      for i in(x_cero..x_uno)
        @canvas[y_cero][i]="X"
      end

      imprimir
    end

  else
    puts 'Just allow line verticals or horizontals or Insert points on the canvas'

  end
end

def painter_rectangle(d)
  x_cero = d[1].to_i
  y_cero = d[2].to_i
  x_uno = d[3].to_i
  y_uno = d[4].to_i
   if x_cero < @vert &&  y_cero < @hor && x_uno < @vert && y_uno < @hor
    ## VERTICAL

       for i in(y_cero..y_uno)
         @canvas[i][x_cero]="X"
       end
       for i in(y_cero..y_uno)
         @canvas[i][x_uno]="X"
       end

 ##HORIZONTAL

       for i in(x_cero..x_uno)
         @canvas[y_cero][i]="X"
       end
       for i in(x_cero..x_uno)
         @canvas[y_uno][i]="X"
       end
       imprimir

   else
     puts 'Insert points on the canvas'

   end
end

def painter_fill(d)
  #puts "#{d}"
  x = d[1].to_i
  y = d[2].to_i
  fill= d[3]

 if @canvas[y][x] == ' '
         @canvas[y][x] = "#{fill}"
         d[1]= x-1
         self.painter_fill(d)
         d[1] = x
         d[2] = y-1
         self.painter_fill(d)
         d[2] = y
         d[1] = x+1
         self.painter_fill(d)
         d[1] = x
         d[2] = y+1
         self.painter_fill(d)
    end

end

end
