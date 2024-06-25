# frozen_string_literal: true

require_relative 'lib/lcd_display'

class Main
  def self.run(args)
    if args.size == 1
      number = args[0]
      size = 2
    elsif args.size == 3 && args[0] == '-v'
      size = args[1].to_i
      number = args[2]
    else
      puts 'Неправильное количество аргументов или неверные опции.'
      return
    end

    lcd = LCD.new(number, size)
    puts lcd.display
  end
end

Main.run(ARGV) if __FILE__ == $PROGRAM_NAME
