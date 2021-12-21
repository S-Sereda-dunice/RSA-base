# frozen_string_literal: true

require_relative 'utils/console_module'
require_relative 'rsa_class'

include Utils::Console

def test
  rsa = Rsa.new
  data = 'lol kek rsa on ruby'
  encrypt(data, rsa)
  decrypt_data = Rsa.decrypt(rsa.encrypt_data, rsa.private_key)

  devider
  puts "decrypt data on singleton |> #{decrypt_data}"
  devider
  puts "decrypt data on instance |> #{rsa.decrypt}"
  devider
end

def encrypt(data = nil, rsa = Rsa.new)
  unless data
    print 'Enter text data: '
    data = gets.chop
  end

  encrypt_data = rsa.encrypt(data)

  devider
  puts "data |> #{data}"
  devider
  puts "public key |> #{rsa.public_key.inspect}"
  devider
  puts "private key |> #{rsa.private_key.inspect}"
  devider
  puts "encrypt data |> #{rsa.encrypt_data}"
  devider
  encrypt_data
end

def decrypt(encrypt_data = nil, private_key = nil)
  unless encrypt_data
    puts 'Enter encrypted data'
    encrypt_data = gets.chop.strip
  end

  unless private_key
    puts 'Enter private key'
    private_key = gets.chop
                      .strip
                      .gsub(/[\[\] ]/, '')
                      .split(',')
  end
  decrypt_data = Rsa.decrypt(encrypt_data, private_key)
  puts "decrypt data |> #{decrypt_data}"
  decrypt_data
end

loop_screen_block do
  print '
    Select a menu item
    1. Test encrypt/decrypt
    2. Encrypt string data
    3. Decrypt string data
    9. Exit
  >> '
  case gets.chop.to_i
  when 1 then test
  when 2 then encrypt
  when 3 then decrypt
  when 9 then break
  else puts 'nope'
  end
end
