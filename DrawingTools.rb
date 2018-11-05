require './UserInput'
require './Painter'




class DrawingTools


   def initialize
     #$canvas

   end

  def run
    @user = UserInput.new
    @user.run
    enter_command
  end

  def enter_command

    validate = true

    while validate do

      puts 'Enter command'
      @command = gets.chomp.to_s
      if !@user.read(@command)
        validate = false
        puts 'Ha salido de la aplicacion'

      end

    end


  end


end
