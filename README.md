# Caesar Cipher

A caesar cipher is an encryption technique used to obfuscate a message. For this version, any alphabetic characters will be shifted to the left or right depending if the shift value is positive or negative. For example:

    Default message: 'Hi'
    Shift: 4
    Shifted message: 'Lm'

If the shift will cause the letter to go past `Z`, it will continue at `A` and move forward. The inverse is also true for going backwards in the alphabet.

    Default message: 'AbC'
    Shift: -5
    Shifted message: 'WxY'

Successfully creating an instance of class `CaesarCipher` will return a shifted message.

```ruby
CaesarCipher.new('Hello, world!', 4)
```

will return

```ruby
'Lipps, asvph!'
```
