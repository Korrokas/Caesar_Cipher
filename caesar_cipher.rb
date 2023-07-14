class CaesarCipher
  attr_reader :message, :shift

  # Upper unicode is 65(A) to 90(Z)
  # Lower unicode is 97(a) to 122(z)

  def initialize(message, shift)
    @message = message
    @shift = shift
  end

  def obfuscate
    new_message = []
    @message.split(' ').each do |char|
      new_message << ascii_shift(char.ord)
    end
    @message = new_message.join
  end

  private

  def ascii_shift(char)
    if char >= 65 && char <= 90 # Uppercase Letters
      char = (char + @shift) % 26
      char += 65 if char < 65

    elsif char >= 97 && char <= 122 # Lowercase Letters
      char = (char + @shift) % 26
      char += 97 if char < 97
    end
    char.chr
  end
end
