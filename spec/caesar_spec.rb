require './caesar_cipher'

describe CaesarCipher do
  context 'initialize' do
    it 'returns argument error if arguments are missing' do
      expect { CaesarCipher.new }.to raise_error(ArgumentError)
    end
  end
end
