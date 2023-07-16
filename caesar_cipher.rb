# frozen_string_literal: true

# Class CaesarCipher will obfuscate a message. The constructor accepts two arguments, first the message, and second the number of positions to shift left or right. All alphabetic characters will be shifted to the left for a negative value or to the right for a positive value.
class CaesarCipher
  attr_reader :message, :shift

  UPPER_START = 65
  UPPER_END = 90
  LOWER_START = 97
  LOWER_END = 122

  def initialize(message, shift)
    raise ArgumentError, 'shift must be an integer only!' if /[A-Za-z]/.match?(shift.to_s)

    @message = message
    @shift = shift

    obfuscate
  end

  private

  def obfuscate
    new_message = []
    @message.split('').each do |char|
      new_char = ascii_shift(char.ord)
      new_message << new_char
    end
    @message = new_message.join
  end

  def ascii_shift(char)
    if char >= UPPER_START && char <= UPPER_END # Uppercase Letters
      char = (((char - UPPER_START) + @shift) % 26) + UPPER_START

    elsif char >= 97 && char <= 122 # Lowercase Letters
      char = (((char - LOWER_START) + @shift) % 26) + LOWER_START
    end
    char.chr
  end
end
