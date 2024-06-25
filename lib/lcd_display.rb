# frozen_string_literal: true

require_relative 'digit_templates'

class LCD
  def initialize(number, size = 2)
    @number = number.to_s
    @size = size
    @output = []
  end

  def display
    @number.chars.each do |digit|
      template = DigitTemplates.template_for(digit)

      @output << scale_line(template[0]) # Верхняя горизонтальная линия
      @size.times { @output << scale_line(template[1]) } # Верхняя вертикальная линия
      @output << scale_line(template[2]) # Средняя горизонтальная линия
      @size.times { @output << scale_line(template[3]) } # Нижняя вертикальная линия
      @output << scale_line(template[4]) # Нижняя горизонтальная линия
      @output << ' ' * @size # Добавляем пробел между цифрами
    end

    @output.join("\n")
  end

  private

  def scale_line(line)
    return line if @size == 1

    scaled_line = ''
    line.each_char do |char|
      scaled_line += if char == '-'
                       '-' * @size
                     elsif char == '|'
                       "|#{' ' * (@size - 1)}"
                     else
                       ' ' * @size
                     end
    end
    scaled_line
  end
end
