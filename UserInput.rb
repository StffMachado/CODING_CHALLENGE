load 'DrawingTools.rb'

class UserInput



def initialize
  @command
  @line
  @rectangle
  $canvas
end

 def run
   @painter = Painter.new
 end

def read(command)
  @command = command

  return convertarray_validatefirstposition(@command)

end

def convertarray_validatefirstposition(command)
  arraycommand = Array.new
  newa = Array.new

  arraycommand << @command
  newa = arraycommand.to_s.delete('"').delete('[').delete(']').delete(',').strip
  if newa[0] == 'C'
    return validate_commandC_position(newa)
  elsif newa[0] == 'L'
    return validate_commandL_position(newa)
  elsif newa[0] == 'R'
    return validate_commandR_position(newa)
  elsif newa[0] == 'B'
    return validate_commandB_position(newa)
  elsif newa[0] == 'Q'
   return  validate_commandQ_position(newa)
  else
    puts ' Enter command= C: Create, L: Line, R: Rectangle, B:Fill, Q:Exit'
    return true
  #  @drawingtools.run
  end
end




def validate_commandC_position(comand)

  num_expres = /\s(\d+)\s(\d+)\b/
  n = num_expres.match(@command.to_s)

  unless n
    puts 'Enter two separate numbers per space'
    return true
  else
    if @command[0] == 'C' && @command[1] == ' '
      num_expres1 = /\s(\d+)\s(\d+)\s(\w+)/
      noexpression = num_expres1.match(@command.to_s)
      unless noexpression
        $canvas = Array.new
        $canvas.insert(0, 'C')
        $canvas.insert(1, n[1])
        $canvas.insert(2, n[2])

        @painter.command_validated($canvas)
        return true
      else
        puts 'Enter two separate numbers per space'
        return true
      end
    end

    end
end


def validate_commandL_position(comand)

  if $canvas != nil
    num_expres = /\s(\d+)\s(\d+)\s(\d+)\s(\d+)\b/
    n = num_expres.match(@command.to_s)

    unless n
      puts 'Enter four separate numbers per space'
      return true
    else
      if @command[0] == 'L' && @command[1] == ' '
        num_expres1 = /\s(\d+)\s(\d+)\s(\d+)\s(\d+)\s(\w+)/
        noexpression = num_expres1.match(@command.to_s)
          unless noexpression


          @line = Array.new
          @line.insert(0, 'L')
          @line.insert(1, n[1])
          @line.insert(2, n[2])
          @line.insert(3, n[3])
          @line.insert(4, n[4])
          if @line[1] == @line[3] || @line[2]== @line[4]
            @painter.command_validated(@line)
            return true
          else
            puts 'Just allow line verticals or horizontals'
            return true
          end
          else
          puts 'Enter four separate numbers per space '
          return true
          end
      else
        puts 'Enter a space between letter'

        return true
      end

    end
    else
     puts 'Create canvas first'

     return true
end
end

def validate_commandR_position(comand)
  if $canvas != nil
    num_expres = /\s(\d+)\s(\d+)\s(\d+)\s(\d+)\b/
    n = num_expres.match(@command.to_s)

    unless n
      puts 'Enter four separate numbers per space'

      return true
    else
      if @command[0] == 'R' && @command[1] == ' '
        num_expres1 = /\s(\d+)\s(\d+)\s(\d+)\s(\d+)\s(\w+)/
        noexpression = num_expres1.match(@command.to_s)
        unless noexpression
          @rectangle = Array.new
          @rectangle.insert(0, 'R')
          @rectangle.insert(1, n[1])
          @rectangle.insert(2, n[2])
          @rectangle.insert(3, n[3])
          @rectangle.insert(4, n[4])

          @painter.command_validated(@rectangle)
          return true

        else
          puts 'Enter four separate numbers per space '

            return true
        end
      end

      end
    else
     puts  'Create canvas first'

     return true
 end
end

def validate_commandB_position(comand)
  if $canvas != nil
    num_expres = /\s(\d+)\s(\d+)\s(\D+)\b/
    n = num_expres.match(@command.to_s)

    unless n
      puts 'Enter two separate numbers per space and a letter'

      return true
    else
      if @command[0] == 'B' && @command[1] == ' '
        num_expres1 = /\s(\d+)\s(\d+)\s\D\s(\w+)/
        noexpression = num_expres1.match(@command.to_s)
        unless noexpression
          @fill = Array.new
          @fill.insert(0, 'B')
          @fill.insert(1, n[1])
          @fill.insert(2, n[2])
          @fill.insert(3, n[3])

          @painter.command_validated(@fill)
          @painter.imprimir
          return true


        else
          puts 'Enter four separate numbers per space '

            return true
        end
      end

      end
   else
     puts  'Create canvas first'

     return true
 end
end

def validate_commandQ_position(comand)
  puts @command
  if @command == 'Q'
    return false
  else

    puts 'For Exit just enter the letter Q'
    return true
  end

end


end
