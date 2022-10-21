#create variables to store ranges of values
alphabet = ("a".."z").to_a
numbers = (1..26).to_a

#hash variable will hold key/value pairs for alpha/nums
alpha_numeric = {}

#push alpha{key} with num{value} to alpha_numeric
for i in numbers
  alpha_numeric[alphabet[i - 1]] = numbers[i - 1]
end

#method to break string into characters
def word_to_letters(string)
  characters = string.downcase.split('')
end

#method to retrive numeric value for each character
def letters_to_numbers(characters, hash)
  word_to_number = []
  characters.each do |i|
    word_to_number.push(hash[i])
  end
  word_to_number
end

#method to shift letter {x} amount of spaces
def shift_space(coded_word, number_to_shift, hash)
  new_number_values = []
  coded_word.each do |i, j|
    i += number_to_shift
    until i <= 26
      j = i - 26
      i = j
    end
    new_number_values.push(i)
  end
  new_number_values
end

#method to convert new number values back to characters
def new_secret_word(shifted_numbers, hash)
  shifted_word = []
  shifted_numbers.each do |num|
    hash.each do |key, value|
      if num == value
        shifted_word.push(key)
      end
    end
  end
  p shifted_word.join('')
end

#method to implement all methods into cipher
def caesar_cipher(string, number_to_shift, encryption_hash)
  characters = word_to_letters(string)
  number_word = letters_to_numbers(characters, encryption_hash)
  shifted_number_word = shift_space(number_word, number_to_shift, encryption_hash)
  ciphered_word = new_secret_word(shifted_number_word, encryption_hash)
end

#get user input for string
def get_word_to_cipher(encryption_hash)
  puts "Enter word to make secret: "
  word = gets.chomp
  puts "Enter number to obfuscate: "
  num = gets.chomp.to_i
  caesar_cipher(word, num, encryption_hash)
end

get_word_to_cipher(alpha_numeric)
