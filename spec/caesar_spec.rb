require './caesar_cipher'

describe CaesarCipher do
  context 'initialize' do
    it 'returns argument error if both arguments are missing' do
      expect { CaesarCipher.new }.to raise_error(ArgumentError)
    end

    it 'returns argument error if one argument is missing' do
      expect { CaesarCipher.new('abc') }.to raise_error(ArgumentError)
    end

    it 'raises exception if message contains non-letters' do
      expect { CaesarCipher.new(12, 1) }.to raise_exception 'message must be letters only!'
    end

    it 'raises exception if shift contains non-numerics' do
      expect { CaesarCipher.new('abc', 'abc') }.to raise_exception 'shift must be an integer only!'
    end

    it 'creates object with string as first argument and integer as second argument' do
      cipher = CaesarCipher.new('abc', 4)
      expect(cipher).to be_an_instance_of(CaesarCipher)
      expect(cipher.message).to eql('abc')
      expect(cipher.shift).to eql(4)
    end
  end
end
