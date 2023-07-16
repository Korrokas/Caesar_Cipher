require './caesar_cipher'

describe CaesarCipher do
  context 'initialize' do
    it 'returns argument error if both arguments are missing' do
      expect { CaesarCipher.new }.to raise_error(ArgumentError)
    end

    it 'returns argument error if one argument is missing' do
      expect { CaesarCipher.new('abc') }.to raise_error(ArgumentError)
    end

    it 'raises exception if shift contains non-numerics' do
      expect { CaesarCipher.new('abc', 'abc') }.to raise_exception 'shift must be an integer only!'
    end

    it 'creates object with string as first argument and integer as second argument' do
      cipher = CaesarCipher.new('abc', 4)
      expect(cipher).to be_an_instance_of(CaesarCipher)
      expect(cipher.message).to be_kind_of(String)
      expect(cipher.shift).to be_kind_of(Numeric)
    end
  end

  context 'obfuscate message' do
    it '("A", 2) standard shift returns C' do
      cipher = CaesarCipher.new('A', 2)
      expect(cipher.message).to eql('C')
    end

    it '("DEF", -4) negative shift returns ZAB' do
      cipher = CaesarCipher.new('DEF', -4)
      expect(cipher.message).to eql('ZAB')
    end

    it '("aXeZBr", 10) mixed case returns kHoJLb' do
      cipher = CaesarCipher.new('aXeZBr', 10)
      expect(cipher.message).to eql('kHoJLb')
    end

    it '("Hello, world!", 4) space/punctuation returns Lipps, asvph!' do
      cipher = CaesarCipher.new('Hello, world!', 4)
      expect(cipher.message).to eql('Lipps, asvph!')
    end

    it '("pass: #4!zaILKj", 2) symbols/digits returns rcuu: #4!bcKNMl' do
      cipher = CaesarCipher.new('pass: #4!zaILKj', 2)
      expect(cipher.message).to eql('rcuu: #4!bcKNMl')
    end
  end
end
