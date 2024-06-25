require_relative '../../lib/lcd_display'

RSpec.describe LCD do
  describe '#display' do
    it 'displays number 2345 with size 2' do
      lcd = LCD.new('2345', 2)
      expected_output = " -   - \n| | | |\n     |\n| | | |\n -   - \n"
      expect(lcd.display).to eq(expected_output)
    end

    it 'displays number 789 with size 1' do
      lcd = LCD.new('789', 1)
      expected_output = " - \n  |\n   \n  |\n   \n"
      expect(lcd.display).to eq(expected_output)
    end

    it 'displays number 1234567890 with size 3' do
      lcd = LCD.new('1234567890', 3)
      expected_output = " -     -     -     -     - \n|  |  | |   |   | | | | | |\n -       -     -       -   \n  |   | |   |   | | |   | \n -       -     -       -   \n"
      expect(lcd.display).to eq(expected_output)
    end
  end
end
